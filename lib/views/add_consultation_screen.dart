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
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddConsulation extends StatelessWidget {
  AddConsulation({super.key});
  TextEditingController date = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController topic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      centerTitle: true,
         

            title:const Text(
              'Add Consultation',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          
       
        ),
     
 
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ConsultationViewModel>(
            builder: (context, viewModel, child) {
          return Column(
            children: [
              TextField(
                controller: date,
                onChanged: (value) => viewModel.date,
                decoration: InputDecoration(labelText: 'Date',hintText: 'Date',border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
                onTap: () async {
                  DateTime? datetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(21000));

                  if (datetime != null) {
                    String formattedDate =
                        DateFormat("yyyy-MM-dd").format(datetime);

                      date.text = formattedDate;
                  }
                }
               
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: timeController,
                onChanged: (value) => viewModel.time,
                decoration: InputDecoration(labelText: 'Time',hintText: 'Time',border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
                 onTap: () async {
                var time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (time != null) {
                    timeController.text = time.format(context);
                }
              },
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: description,
                onChanged: (value) => viewModel.description,
                decoration: InputDecoration(labelText: 'Description',hintText: 'Description',border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: topic,
                onChanged: (value) => viewModel.topic,
                decoration: InputDecoration(labelText: 'Topic',hintText: 'Topic',border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
               width: double.infinity,
                child: FloatingActionButton(
               //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteManager.consultationDetailsPage);
                      viewModel.addConsultation(
                          date.text.toString(),
                          timeController.text.toString(),
                          description.text.toString(),
                          topic.text.toString());
                      viewModel.consultationIndex = viewModel.list.length - 1;
                      viewModel.isExist = false;
                    },
                    child: const Text('Save', style: TextStyle(fontSize: 18))),
              )
            ],
          );
        }),
      ),
    );
  }
}
