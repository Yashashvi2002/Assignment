import 'dart:io';
import 'package:assignment/profile.dart';
import 'package:assignment/Task_Controller/task.dart';
import 'package:assignment/Task_Controller/task_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Policy.dart';
import 'Task_Controller/task_container.dart';
import 'Themes/constants.dart';
import 'Themes/custom_icons.dart';
import 'firebase_options.dart';
import 'open_list.dart';
import 'Ordinary_Title/ordinary_title1.dart';
import 'Ordinary_Title/ordinary_title2.dart';
import 'Ordinary_Title/ordinary_title3.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash_screen0',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          color: Color(0xFFDAF0FF),
          elevation: 0,
        ),
      ),
      routes: {
        'splash_screen0': (context) => SplashScreen0(),
        'task_list_page': (context) =>TaskListPage(addTaskCallback: (Task task) {}),
      },
    );
  }
}


//Main Screen /Start Screen
//profile, name, email, phone number hasn't been linked with firebase yet
class SplashScreen0 extends StatefulWidget {
  const SplashScreen0({super.key});

  @override
  _SplashScreen0State createState() => _SplashScreen0State();
}

class _SplashScreen0State extends State<SplashScreen0> {
  String? _profileImageUrl;
  String _name = '';
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _fetchTasks(); // Fetch tasks data
  }

  void _loadProfileData() async {
    final savedData = await _fetchSavedData();
    setState(() {
      _profileImageUrl = savedData['imageUrl'];
      _name = savedData['name'] ?? ''; // Null safety check
    });
  }

  Future<Map<String, String?>> _fetchSavedData() async {
    return {'imageUrl': null, 'name': ''};
  }

  void _fetchTasks() async {
    FirebaseFirestore.instance.collection('tasks').snapshots().listen((snapshot) {
      List<Task> loadedTasks = snapshot.docs.map((doc) {
        return Task(
          title: doc['title'],
          description: doc['description'],
          completed: doc['completed'] ?? false,
          id: doc.id,
          dueDate: DateTime.parse(doc['dueDate']),
        );
      }).toList();

      setState(() {
        tasks = loadedTasks;
      });
    });
  }

  void _updateProfileData(String? imageUrl, String name) {
    setState(() {
      if (imageUrl != null) {
        _profileImageUrl = imageUrl;
      }
      _name = name;
    });
  }

  String _getGreetingMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(
                                initialName: _name,
                                initialImage: _profileImageUrl != null ? File(_profileImageUrl!) : null,
                              ),
                            ),
                          );
                          if (result != null) {
                            _updateProfileData(result['imageUrl'], result['name']);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: kShadow,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade200,
                            child: Transform.scale(
                              scale: 0.9, // Adjust this value to change the size of the image
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: _profileImageUrl != null
                                    ? FileImage(File(_profileImageUrl!))
                                    : AssetImage('assets/Images/profile.png') as ImageProvider,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreetingMessage(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 100),
                            child: Text(
                              _name.isEmpty ? 'User' : _name,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomIconButton(
                        icon: Icons.chat_bubble_outline,
                        onPressed: () {
                          // Handle chat icon pressed
                        },
                      ),
                      SizedBox(width: 10),
                      CustomIconButton(
                        icon: Icons.notifications_none,
                        onPressed: () {
                          // Handle notification icon pressed
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 80.0,
                    width: 360.0,
                    child: TaskContainer(
                      totalTasks: tasks.length,
                      completedTasks: tasks.where((task) => task.completed).length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Ordinary Title 1",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  OrdinaryTitle1(),
                  const SizedBox(height: 20),
                  Text(
                    "Ordinary Title 2",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  OrdinaryTitle2(),
                  const SizedBox(height: 20),
                  Text(
                    "Ordinary Title 3",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  OrdinayTitle3(),
                  const SizedBox(height: 10),
                  Openlist(),
                  const SizedBox(height: 20),
                  Policy(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

