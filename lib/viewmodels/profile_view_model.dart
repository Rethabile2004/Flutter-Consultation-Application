//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:consultation_management_application/models/profile_data.dart';

// class to link the model with the view
class ProfileViewModel with ChangeNotifier {
  final ProfileData _profileData = ProfileData(
    name: 'John Doe',
    role: 'Software Developer',
    email: 'johndoe@icloud.com',
    phoneNumber: '051 507 4382',
  );

  String get name => _profileData.name;
  String get role => _profileData.role;
  String get email => _profileData.email;
  String get phoneNumber => _profileData.phoneNumber;
  File? get image => _profileData.image;

  void updateName(String newName) {
    _profileData.name = newName;
    notifyListeners();
  }

  void updateRole(String newRole) {
    _profileData.role = newRole;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _profileData.email = newEmail;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _profileData.phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void updateImage(File newImage) {
    _profileData.image = newImage;
    notifyListeners();
  }
}
