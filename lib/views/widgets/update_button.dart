//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:consultation_management_application/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (BuildContext context,
        ProfileViewModel profileviewmodel, Widget? child) {
      return Center(
        child: SizedBox(
          height: 50, // Sets the button height
          width: 150, // Sets the button width
          child: ElevatedButton(
            onPressed: () {
              // Updates the user's profile details when the button is pressed
              profileviewmodel.updateName('Rethabile Eric Siase'); // Updates the name
              profileviewmodel.updateRole('Flutter Developer'); // Updates the role
              profileviewmodel
                  .updateEmail('ericksiase375@icloud.com'); // Updates the email
              profileviewmodel
                  .updatePhoneNumber('0752626847'); // Updates the phone number
            },
            child: const Center(child: Text('Update Details')), // Button label
          ),
        ),
      );
    });
  }
}
