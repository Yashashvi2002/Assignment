import 'dart:io';
import 'package:assignment/profile.dart';
import 'package:assignment/task.dart';
import 'package:assignment/task_controller.dart';
import 'package:assignment/task_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Policy.dart';
import 'constants.dart';
import 'custom_icons.dart';
import 'open_list.dart';
import 'ordinary_title1.dart';
import 'ordinary_title2.dart';
//import 'ordinary_title3.dart';filal ke liye

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
        'task_list_page': (context) => TaskListPage( addTaskCallback: (Task task) {}),
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
  List<Task> tasks = []; // Initialize tasks list

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    // _fetchTasks(); // Fetch tasks data
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
    // Simulated saved data fetching, replace with actual implementation
    return {'imageUrl': null, 'name': ''};
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

  // Function to fetch tasks data from Firestore
  // void _fetchTasks() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('tasks').get();
  //   List<Task> fetchedTasks = snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
  //
  //   setState(() {
  //     tasks = fetchedTasks;
  //   });
  // }

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
                  Container(
                    height: 80.0, // Adjust height as needed
                    width: 360.0, // Adjust width as needed
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
                  //OrdinaryTitle2(),
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

class OrdinayTitle3 extends StatefulWidget {
  const OrdinayTitle3({super.key});

  @override
  State<OrdinayTitle3> createState() => _OrdinayTitle3State();
}

class _OrdinayTitle3State extends State<OrdinayTitle3> {
  Future<void> openAppWebView(String url) async { //for opening external link in appView
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                openAppWebView('https://cookieandkate.com/peanut-butter-oatmeal-cookies-recipe/');
              },//on tapping the image
              child: Container(
                width: 314,
                height: 173.25, // height to match the image height
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  // borderRadius: BorderRadius.circular(8), // Add border radius if needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 173.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Images/cookies.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 20.0, // Adjust height as desired
                          width: 80.0,
                          padding: EdgeInsets.all(3.0), // Add some padding for the text
                          decoration: BoxDecoration(
                            color: Colors.white, // Change this to your desired color
                            borderRadius: BorderRadius.circular(5.0), // This makes the corners rounded
                          ),
                          child: Center(
                            child: Text(
                              "Article tag",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10, // Increase the font size to make the text visible
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),
                        Text("January 1st,2024",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),),
                        Spacer(),

                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryLightColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius:10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.blue,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Healthy Cookies",
                        style: TextStyle(
                            color: Color(0xFF042B59),
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "These chocolate chip healthy cookies are soft, chewy, and the perfect healthy dessert recipe.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                openAppWebView('https://cookieandkate.com/chunky-avocado-salsa-recipe/');
              },//on tapping the image
              child: Container(
                width: 314,
                height: 173.25, // height to match the image height
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  // borderRadius: BorderRadius.circular(8), // Add border radius if needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 173.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Images/Avocado_Salsa.jpeg'),
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 20.0,
                          width: 80.0,
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0), // This makes the corners rounded
                          ),
                          child: Center(
                            child: Text(
                              "Article tag",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10, // Increase the font size to make the text visible
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),
                        Text("January 1st,2024",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10, // Increase the font size to make the text visible
                        ),),
                        Spacer(),

                        Container(
                          width: 30,  // Adjust the width to reduce the circle radius
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryLightColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius:10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.blue,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Avocado Salsa",style: TextStyle(
                          color: Color(0xFF042B59),
                          fontSize: 18,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("This is a perfect recipe for a picnic, barbecue or party! You can never go wrong with an avocado salsa.",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                openAppWebView('https://cookieandkate.com/healthy-banana-pancakes-recipe/');
              },//on tapping the image
              child: Container(
                width: 314,
                height: 173.25, // Set the height to match the image height
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  // borderRadius: BorderRadius.circular(8), // Add border radius if needed
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 173.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Images/banana_pancake.png'),
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 20.0, // Adjust height as desired
                          width: 80.0,
                          padding: EdgeInsets.all(3.0), // Add some padding for the text
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0), // This makes the corners rounded
                          ),
                          child: Center(
                            child: Text(
                              "Article tag",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10, // Increase the font size to make the text visible
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),
                        Text("January 1st,2024",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10, // Increase the font size to make the text visible
                        ),),
                        Spacer(),

                        Container(
                          width: 30,  // Adjust the width to reduce the circle radius
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryLightColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius:10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.blue,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Healthy Banana Pancakes",style: TextStyle(
                          color: Color(0xFF042B59),
                          fontSize: 18,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Rolls, bagels, baps and wraps – make a lunch that\'s delicious, nutritious and filling enough to keep you going all afternoon.",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

