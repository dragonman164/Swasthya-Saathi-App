import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'homescreen.dart';


class LoadingScreen extends StatefulWidget {

  static String routeName = '/';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 @override
  void initState() {
    // TODO: implement initState
   Timer(Duration(seconds: 2), () {
     Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
   });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.white,
        ),

      ),

    );
  }
}
