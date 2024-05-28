import 'dart:io';
import 'package:assignment/profile.dart';
import 'package:assignment/task_list_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_icons.dart';
import 'ordinary_title3.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        'task_list_page': (context) => TaskListPage(),
      },
    );
  }
}

class SplashScreen0 extends StatefulWidget {
  @override
  _SplashScreen0State createState() => _SplashScreen0State();
}

class _SplashScreen0State extends State<SplashScreen0> {
  String? _profileImageUrl;
  String _name = '';
  int _totalTasks = 0;
  int _completedTasks = 0;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _fetchTasks();
  }

  void _loadProfileData() async {
    final savedData = await _fetchSavedData();
    if (savedData != null) {
      setState(() {
        _profileImageUrl = savedData['imageUrl'];
        _name = savedData['name'] ?? ''; // Null safety check
      });
    }
  }

  Future<Map<String, String?>> _fetchSavedData() async {
    return {'imageUrl': null, 'name': ''};
  }

  void _fetchTasks() async {
    // Simulate fetching tasks
    final totalTasks = 10;
    final completedTasks = 5;

    setState(() {
      _totalTasks = totalTasks;
      _completedTasks = completedTasks;
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
                          // Navigate to settings page
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
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: _profileImageUrl != null
                              ? FileImage(File(_profileImageUrl!))
                              : AssetImage('assets/Images/profile.png') as ImageProvider,
                          backgroundColor: Colors.grey.shade200,
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
                      SizedBox(width: 10), // Space between the two icons
                      CustomIconButton(
                        icon: Icons.notifications_none,
                        onPressed: () {
                          // Handle notification icon pressed
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TaskContainer(totalTasks: _totalTasks, completedTasks: _completedTasks),
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

class TaskContainer extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const TaskContainer({
    Key? key,
    required this.totalTasks,
    required this.completedTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double completionPercentage = totalTasks > 0 ? completedTasks / totalTasks : 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'task_list_page'),
        child: Container(
          height: 80.0,
          width: 360.0,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0, // Adjust for desired shadow spread
                blurRadius: 5.0, // Adjust for desired shadow blur
                offset: Offset(0, 3), // Adjust for shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0), // Adjust padding as needed
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor, // Adjust color as desired
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center, // Align child widgets to center
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: Colors.black.withOpacity(0.07), // Adjust transparency as desired
                              strokeWidth: 5.0,
                              value: completionPercentage,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Adjust color as desired
                            ),
                            SizedBox(
                              width: 50.0, // Adjust width and height for desired size
                              height: 50.0, // Adjust width and height for desired size
                              child: Center(
                                child: Text(
                                  "${(completionPercentage * 100).toStringAsFixed(1)}%", // Format percentage
                                  style: TextStyle(
                                    color: Colors.blue, // Adjust color as desired
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "This is the task list. Opens a dialogue box showing tasks, read more...",
                        overflow: TextOverflow.ellipsis, // Add this to handle long text
                        maxLines: 2, // Maximum number of lines the text can occupy.
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class OrdinaryTitle1 extends StatefulWidget {
  const OrdinaryTitle1({super.key});

  @override
  State<OrdinaryTitle1> createState() => _OrdinaryTitle1State();
}

class _OrdinaryTitle1State extends State<OrdinaryTitle1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskListPage()), // Replace with desired page
          ),
          child: Container(
            height: 110.0, // Adjust height as desired
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0, // Adjust for desired shadow spread
                  blurRadius: 5.0, // Adjust for desired shadow blur
                  offset: Offset(0, 3), // Adjust for shadow position
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 1   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Spacer(),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskListPage()),
          ),
          child: Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0, // Adjust for desired shadow spread
                  blurRadius: 5.0, // Adjust for desired shadow blur
                  offset: Offset(0, 3), // Adjust for shadow position
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 2   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskListPage()),
          ),
          child: Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0, // Adjust for desired shadow spread
                  blurRadius: 5.0, // Adjust for desired shadow blur
                  offset: Offset(0, 3), // Adjust for shadow position
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 3   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class OrdinaryTitle2 extends StatefulWidget {
  const OrdinaryTitle2({super.key});

  @override
  State<OrdinaryTitle2> createState() => _OrdinaryTitle2State();
}

class _OrdinaryTitle2State extends State<OrdinaryTitle2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80.0,
          width: 360.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), // This makes the corners rounded
          ),
          child: Text(
            'This is a state box with a message, showing that the section is empty right now',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        )

      ],
    ));
  }
}

class Openlist extends StatefulWidget {
  const Openlist({super.key});

  @override
  State<Openlist> createState() => _OpenlistState();
}

class _OpenlistState extends State<Openlist> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0, // Adjust for desired shadow spread
                blurRadius: 5.0, // Adjust for desired shadow blur
                offset: Offset(0, 3), // Adjust for shadow position
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              children: [
                Center(child: Text("Open List"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a random photo note with nothing specific, but could contain details that end this page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  child: Text(
                    'Privacy',
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Text(
                    'Terms',
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}

