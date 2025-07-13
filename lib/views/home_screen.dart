//
// Coder                    : Rethabile Eric Siase
// Time taken to complete   : 2 days 
// Number of external help  : 0
// Purpose                  : To help users manage their consultation appointments
//

import 'package:flutter/material.dart';
import 'package:consultation_management_application/routes/route_manager.dart';
import 'package:consultation_management_application/views/widgets/consultationList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text(
            'Consulation Booking',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          trailing: Icon(Icons.person, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Upcoming Appointmeints',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.black)),
        ),
        SizedBox(
          height: 10,
        ),
        MyWidget(),
      ]),
      bottomNavigationBar: BottomAppBar(
        shape:
            const CircularNotchedRectangle(), // Adds a predefined curved shape
        notchMargin: 8.0, // Space around a floating action button
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.homePage);
                }),
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.profilePage);
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteManager.addConsulationPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
