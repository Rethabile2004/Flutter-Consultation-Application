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


class ConsulatationDetails extends StatelessWidget {
  const ConsulatationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      centerTitle: true,
         

            title:const Text(
              'Consultation Details',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          
       
        ),
      body:
          Consumer<ConsultationViewModel>(builder: (context, viewModel, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text('Date: ${viewModel.list[viewModel.consultationIndex].date}'),
              ],
            ),
           const Divider(thickness: 0.5,),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text('Time: ${viewModel.list[viewModel.consultationIndex].time}'),
              ],
            ),
            const Divider(thickness: 0.5,),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                    'Description: ${viewModel.list[viewModel.consultationIndex].description}'),
              ],
            ),
            const Divider(thickness: 0.5,),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text('Topic: ${viewModel.list[viewModel.consultationIndex].topic}'),
              ],
            ),
            const Divider(thickness: 0.5,),
            const SizedBox(
              height: 20,
            ),
            Column(
           
              children: [
                SizedBox(
                  
                    width: double.infinity,
                  height:50,
                  child: FloatingActionButton(
                  
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.homePage);
                  
                        if (viewModel.isExist == false) {
                          viewModel.addConsutationScackBar(context);
                        }
                      },
                      child: const Text('Home',
                          style: TextStyle(fontSize: 18))),
                ),
                       const  SizedBox(
               
                  height:20,
                         ),
                SizedBox(
                  width: double.infinity,
                  height:50,

                  child: FloatingActionButton(
                  //  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        viewModel.removeConfirmation(context);
                      },
                      child: const Text('Delete',
                          style: TextStyle(fontSize: 18))),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
