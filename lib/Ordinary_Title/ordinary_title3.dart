
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Themes/constants.dart';


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
    return SizedBox(
      height: 308,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Layout_1(
            title: 'Healthy Cookies',
            description: "These chocolate chip healthy cookies are soft, chewy, and the perfect healthy dessert recipe.",
            date: 'January 1st,2024',
            url: 'https://cookieandkate.com/peanut-butter-oatmeal-cookies-recipe/',
            image: 'assets/Images/cookies.png',),
          Layout_1(
            title: 'Avocado Salsa',
            description: "This is a perfect recipe for a picnic, barbecue or party! You can never go wrong with an avocado salsa.",
            date: 'January 1st,2024',
            url: 'https://cookieandkate.com/chunky-avocado-salsa-recipe/',
            image: 'assets/Images/Avocado_Salsa.jpeg',),
          Layout_1(
            title: 'Healthy Banana Pancakes',
            description: "Rolls, bagels, baps and wraps – make a lunch that's delicious, nutritious and filling enough to keep you going all afternoon.",
            date: 'February 27,2023', url: 'https://cookieandkate.com/healthy-banana-pancakes-recipe/',
            image: 'assets/Images/banana_pancake.png',)

        ],
      ),
    );
  }
}

//Design for displaying the title and article
class Layout_1 extends StatefulWidget {
  const Layout_1({super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.url,
    required this.image});
  final String title, description, date, url, image;


  @override
  State<Layout_1> createState() => _Layout_1State();
}

class _Layout_1State extends State<Layout_1> {
  bool isSaved = false;
  Future<void> openAppWebView(String url) async {     //for opening external link in appView
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          openAppWebView(widget.url);
        },//on tapping the image
        child: Container(
          width: 314,
          height: 173.25,     // Set the height to match the image height
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 173.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
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
                  Text(widget.date,style: TextStyle(
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
                      onPressed: () {
                        setState(() {
                          isSaved = !isSaved;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Saved'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.bookmark,
                        color: Colors.blue, // Change the icon color to white
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(widget.title,style: TextStyle(
                    color: Color(0xFF042B59),
                    fontSize: 18,fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(widget.description,style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

