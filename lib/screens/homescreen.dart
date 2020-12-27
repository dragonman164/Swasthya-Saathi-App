import 'package:flutter/material.dart';
import 'userscreen.dart';
import 'adminlogin.dart';
import 'appdetails.dart';


class HomeScreen extends StatelessWidget {

  static String routeName = '/HomeScreen';
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
//      appBar: AppBar(title: Text('Real Time Patient Monitoring System'),),
        body:Column(
          children: [
            Container(
              width: 300,
              height: 300,
          margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 5,color: Colors.black,style: BorderStyle.solid),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/doctor.jpg'),
                ),

              ),
            ),
            Text('Welcome to Swasthya Saathi App',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            RaisedButton.icon(
              padding: EdgeInsets.all(13),
              label: Text('Check User Status',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              icon: Icon(Icons.person,color: Colors.red,),

              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.red,width: 2)
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(UserStatusScreen.routeName);
              },
            ),
            SizedBox(height: 20,),
            RaisedButton.icon(
            padding: EdgeInsets.all(13),
              icon: Icon(Icons.lock,color: Colors.orange,),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.red,width: 2)
              ),
              color: Colors.deepPurpleAccent,
             label: Text('Login as admin',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              onPressed: () {
              Navigator.of(context).pushNamed(AdminLoginScreen.routeName);
              },
            ),
            SizedBox(height: 20,),
            RaisedButton.icon(
              padding: EdgeInsets.all(13),
              icon: Icon(Icons.help,color: Colors.black,),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.pink,width: 2)
              ),
              color: Colors.deepOrange,
              label: Text('Learn more....',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              onPressed: () {
                Navigator.of(context).pushNamed(AppDetails.routeName);

              },
            )

          ],
        )
      ),
    );
  }
}
