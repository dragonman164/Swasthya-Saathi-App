import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/loadingscreen.dart';
import 'screens/userscreen.dart';
import 'screens/adminlogin.dart';
import 'screens/admindashboard.dart';
import 'screens/userdetails.dart';
import 'screens/appdetails.dart';
import 'screens/addpatient.dart';
import 'screens/monitorpatient.dart';
import 'screens/updatepatientdata.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Demo',
      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context)=>LoadingScreen(),
       HomeScreen.routeName:(context)=>HomeScreen(),
        UserStatusScreen.routeName:(context)=>UserStatusScreen(),
        AdminLoginScreen.routeName:(context)=>AdminLoginScreen(),
        AdminDashboard.routeName:(context)=>AdminDashboard(),
        UserDetails.routeName:(context)=>UserDetails(),
        AppDetails.routeName:(context)=>AppDetails(),
        AddPatient.routeName:(context)=>AddPatient(),
        MonitorPatient.routeName:(context)=>MonitorPatient(),
        UpdateData.routeName:(context)=>UpdateData(),
      },
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.purple[200],
        accentColor: Colors.white,
      ),
    );
  }
}

