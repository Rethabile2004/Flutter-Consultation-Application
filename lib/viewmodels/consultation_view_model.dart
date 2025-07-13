//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:flutter/material.dart';
import 'package:consultation_management_application/models/consultation.dart';
import 'package:consultation_management_application/routes/route_manager.dart';

// class to link the model with the view
class ConsultationViewModel with ChangeNotifier {
  Consultation consultationViewModel =
      Consultation(date: '', time: '', description: '', topic: '');

  //list to store all the consulations
  List<Consultation> list = [];
  //caries the index of a selected consultation
  int consultationIndex = 0;
  //used to determine if a consultation already exists
  bool isExist = false;
  //used for BottomNavigationBar() navigation handling
  int selectedIndex = 0;

  String get date => consultationViewModel.date;
  String get time => consultationViewModel.time;
  String get description => consultationViewModel.description;
  String get topic => consultationViewModel.topic;
  
  
  void addConsultation(
      String date1, String time1, String description1, String topic1) {
    list.add(Consultation(
        date: date1, time: time1, description: description1, topic: topic1));
    notifyListeners();
  }


  void addConsutationScackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      
      const  SnackBar(
          
          content:  Text('Consultation added successfully',textAlign: TextAlign.center,),));
  }

  void removeConsutationScackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consultation removed successfully',textAlign: TextAlign.center,)));
  }

  void removeConfirmation(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Consultation'),
            content: const Text(
                'Are you sure you want to delete this consultation?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.homePage);
                  list.removeAt(consultationIndex);
                  removeConsutationScackBar(context);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }
}
