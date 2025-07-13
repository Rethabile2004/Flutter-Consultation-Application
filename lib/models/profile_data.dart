//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'dart:io';

// profile screen model data
class ProfileData {
  String name;
  String role;
  String email;
  String phoneNumber;
  File? image;

  ProfileData({
    required this.name,
    required this.role,
    required this.email,
    required this.phoneNumber,
    this.image,
  });
}
