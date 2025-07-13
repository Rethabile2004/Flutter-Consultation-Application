//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:flutter/material.dart';
import 'package:consultation_management_application/views/add_consultation_screen.dart';
import 'package:consultation_management_application/views/consultation_details.dart';
import 'package:consultation_management_application/views/home_screen.dart';
import 'package:consultation_management_application/views/profile_page.dart';

// class to manage route accross screens
class RouteManager {
  static const String homePage = '/';
  static const String addConsulationPage = '/addConsultation';
  static const String consultationDetailsPage = '/consulatationDetails';
  static const String profilePage = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case addConsulationPage:
        return MaterialPageRoute(builder: (context) => AddConsulation());
      case consultationDetailsPage:
        return MaterialPageRoute(
            builder: (context) => const ConsulatationDetails());
      case profilePage:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      default:
        return throw const FormatException('Page not Found');
    }
  }
}
