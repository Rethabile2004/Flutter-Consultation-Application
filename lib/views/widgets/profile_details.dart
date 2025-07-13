//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:consultation_management_application/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (BuildContext context,
        ProfileViewModel profileviewmodel, Widget? child) {
      return Center(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start (left)
          children: [
            // Display the user's name with bold and larger font size
            Text(
              profileviewmodel.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Display the user's role with a smaller, grey font
            Text(
              profileviewmodel.role,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20), // Add some spacing
        
            // Display the user's email address
            Text(
              'Email: ${profileviewmodel.email}',
              style: const TextStyle(fontSize: 16),
            ),
            // Display the user's phone number
            Text(
              'Phone: ${profileviewmodel.phoneNumber}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }
}
