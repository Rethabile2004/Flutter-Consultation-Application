//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:flutter/material.dart';
import 'package:consultation_management_application/routes/route_manager.dart';
import 'package:consultation_management_application/viewmodels/consultation_view_model.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConsultationViewModel>(
        builder: (context, viewModel, child) {
      return Builder(
        builder: (context) {
          return  viewModel.list.isEmpty? const Column(
            children: [
              SizedBox(height: 230,),
              Center(child: Text('No Upcoming Coming Consultation',style:TextStyle(color:Colors.grey))),
            ],
          ):  SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: viewModel.list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                     
                      Card(
                        elevation: 0.7,
                        child: ListTile(
                          title: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteManager.consultationDetailsPage);
                                viewModel.consultationIndex = index;
                                viewModel.isExist = true;
                              },
                              child: Text(viewModel.list[index].description,textAlign: TextAlign.center,),
                              
                              )
                              ,
                        ),
                      ),
                      
                    ],
                  );
                  
                }),
          );
        }
      );
    });
  }
}


