//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:consultation_management_application/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileImage2 extends StatelessWidget {
  final VoidCallback onImagePick; // Callback function to handle image picking

  const ProfileImage2({super.key, required this.onImagePick});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) {
        return GestureDetector(
          onTap:
              onImagePick, // Calls the function when the user taps the avatar
          child: Center(
            child: CircleAvatar(
                radius: 70, // Sets the size of the profile picture
                backgroundImage: profileViewModel.image != null
                    ? FileImage(profileViewModel
                        .image!) // Displays selected image if available
                    : const NetworkImage('https://picsum.photos/250?image=9')
                        as ImageProvider, // Default image when no image is selected
                child: profileViewModel.image == null
                    ? const Icon(
                        Icons
                            .camera_alt, // Displays a camera icon if no image is selected
                        size: 50,
                        color: Colors.white,
                      )
                    : null),
          ),
        );
      },
    );
  }
}
