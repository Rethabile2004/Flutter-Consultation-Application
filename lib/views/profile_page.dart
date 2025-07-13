//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:consultation_management_application/routes/route_manager.dart';
import 'package:consultation_management_application/viewmodels/profile_view_model.dart';
import 'package:consultation_management_application/views/widgets/profile_details.dart';
import 'package:consultation_management_application/views/widgets/profile_image.dart';
import 'package:consultation_management_application/views/widgets/update_button.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  // Variable to store the selected profile image
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Update the image in the ProfileViewModel using Provider
      // ignore: use_build_context_synchronously
      Provider.of<ProfileViewModel>(context, listen: false)
          .updateImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Centers the title in the app bar
          title: const Text(
            'Profile Page',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: LayoutBuilder(
          // Determines the layout based on screen width
          // ignore: non_constant_identifier_names
          builder: (context, Constraints) {
            if (Constraints.maxWidth > 600) {
              // Layout for larger screens (tablet or desktop)
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          ProfileImage2(
                              onImagePick: _pickImage), // Profile image picker
                          const ProfileDetails(), // Displays user profile details
                        ],
                      ),
                      const SizedBox(width: 20),
                      const UpdateButton(), // Button for updating profile details
                    ],
                  ),
                ],
              );
            } else {
              // Layout for smaller screens (mobile)
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  ProfileImage2(
                      onImagePick: _pickImage), // Profile image picker
                  const SizedBox(height: 10),
                  const ProfileDetails(), // Displays user profile details
                  const SizedBox(height: 20),
                  const UpdateButton(), // Button for updating profile details
                ],
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape:
              const CircularNotchedRectangle(), // Adds a predefined curved shape
          notchMargin: 8.0, // Space around the floating action button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home button
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteManager.homePage);
                  }),

              // Profile button
              IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteManager.profilePage);
                  }),
            ],
          ),
        ));
  }
}
