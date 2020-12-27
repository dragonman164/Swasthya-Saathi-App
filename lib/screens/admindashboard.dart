import 'package:flutter/material.dart';
import 'userscreen.dart';
import 'addpatient.dart';
import 'updatepatientdata.dart';

class AdminDashboard extends StatelessWidget {
  static String routeName = '/adminDashboard';

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
          title: Text('Admin Dashboard',style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: Theme.of(context).primaryColor,

        ),
        body: Column(
          children: [
            InkWell(
             child: Container(
          width: 260,
          height: 150,
          margin: EdgeInsets.only(left: 40,top: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [Colors.green,Colors.lightGreen]
            ),
          ),
               child: Text('Check Status of Patients',style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),),
             ),
              onTap: () {
              Navigator.of(context).pushNamed(UserStatusScreen.routeName);
              },
            ),
            InkWell(
              child: Container(
                width: 260,
                height: 150,
                margin: EdgeInsets.only(left: 40,top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [Colors.red,Colors.orange]
                  ),
                ),
                child: Text('Add a new Patient',style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              onTap: () {
               Navigator.of(context).pushNamed(AddPatient.routeName);
              },
            ),
            InkWell(
              child: Container(
                width: 260,
                height: 150,
                margin: EdgeInsets.only(left: 40,top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [Colors.pink,Colors.pinkAccent]
                  ),
                ),
                child: Text('Update Patient Data',style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(UpdateData.routeName);
              },
            ),
          ],
        )
      ),
    );
  }
}
