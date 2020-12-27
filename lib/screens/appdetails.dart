import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDetails extends StatelessWidget {
  static String routeName = '/appDetails';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.blue[500],
            Colors.blue[400],
            Colors.blue[300],
            Colors.blue[200],


          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('How this app Works?',style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        body: Stack(
          children: [

            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/home.jpeg'),
                      fit: BoxFit.cover)),
            ),

            Container(
              height: 300,
              width: 500,
              color: Colors.white,
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('We know you care about your loved ones, so here\'s you can keep a check on your loved one\'s health',style: TextStyle(
                fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Text('Enter your patient\'s registration number to get real time details',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,),
                  Text('OR',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('If you are admin, login as admin',textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 18
                  ),),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
