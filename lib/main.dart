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
import 'package:consultation_management_application/viewmodels/profile_view_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConsultationViewModel(),
        ),
         ChangeNotifierProvider(
           create: (context) => ProfileViewModel(),
         )
      ],
      child: MaterialApp(
        initialRoute: RouteManager.homePage,
        onGenerateRoute: RouteManager.generateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          snackBarTheme:const SnackBarThemeData(actionTextColor:  Colors.black,
contentTextStyle: TextStyle(color: Colors.black,fontSize: 17.5,fontWeight: FontWeight.w300),
            backgroundColor:  Color.fromARGB(255, 159, 212, 238),elevation: 0.7),
          scaffoldBackgroundColor:  Colors.white  ,
          colorScheme: ColorScheme.fromSeed(seedColor:  Colors.red),
         
          fontFamily: 'Georgia',
          appBarTheme: const AppBarTheme(
             backgroundColor:Colors.red  ,
              iconTheme: IconThemeData(color: Colors.white),
              
              elevation: 0.7,
              titleTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
              shadowColor: Colors.grey,
             ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w100)),
        
          
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
             backgroundColor: Colors.red  ,
             
           
             elevation: 0.7,
             selectedItemColor: Colors.white,
             unselectedItemColor: Colors.white,
             selectedIconTheme: IconThemeData(color: Colors.white),
             unselectedIconTheme: IconThemeData(color: Colors.white)
          )
        ),
      ),
    );
  }
}
