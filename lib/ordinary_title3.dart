
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';


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
