import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'Themes/constants.dart';

// Profile setting is here along with Camera setting

class SettingsPage extends StatefulWidget {
  final String initialName;
  final File? initialImage;


  const SettingsPage({super.key, required this.initialName, required this.initialImage});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _picker = ImagePicker();  // ImagePicker instance to pick image from gallery
  final _formKey = GlobalKey<FormState>();  // GlobalKey instance for form state// GlobalKey instance for form state

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.initialName;
    imageFile = widget.initialImage;
  }

  // Method to pick and crop image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
          uiSettings: [AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
            IOSUiSettings(
              title: "Image Cropper",
            )
          ]
      );
      if (croppedFile != null) {
        setState(() {
          imageFile = File(croppedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children:[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: kShadow,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                    child: Transform.scale(
                      scale: 1, // Adjust this value to change the size of the image
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: imageFile != null
                            ? FileImage(imageFile!)
                            : const AssetImage('assets/Images/profile.png') as ImageProvider,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),

              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => nameController.text = value!,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => emailController.text = value!,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) => phoneController.text = value!,
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context, {'imageUrl': imageFile?.path, 'name': nameController.text});
                    }
                  },
                  child: Container(
                    height: 30.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: kShadow,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Center(child: Text("Save")),
                    ),
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
