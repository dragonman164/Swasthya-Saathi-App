import 'package:flutter/material.dart';
import 'monitorpatient.dart';

class UserDetails extends StatelessWidget {
  static String routeName = '/userDetails';
  @override
  Widget build(BuildContext context) {

    final Map data= ModalRoute.of(context).settings.arguments as Map;
    print(data['details']);


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
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('User Details Screen',style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: Column(
          children: [
            Container(

              margin: EdgeInsets.only(top: 20,left: 20),
              width: 300,
              height: 50,
              child: Row(
                children: [
                  Text(' Registration Number: ',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text(data['details']['regnumber'],style: TextStyle(
                    fontSize: 20,
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
                border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
              ),

            ),
            Container(

              margin: EdgeInsets.only(top: 20,left: 20),
              width: 250,
              height: 50,
              child: Row(
                children: [
                  Text(' Name: ',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text(data['details']['fname'] + ' '+  data['details']['lname'],style: TextStyle(
                    fontSize: 20,
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
                border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
              ),

            ),
            Container(

              margin: EdgeInsets.only(top: 20,left: 20),
              width: 250,
              height: 50,
              child: Row(
                children: [
                  Text(' Room Number ',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text(data['details']['roomnumber'].toString(),style: TextStyle(
                    fontSize: 20,
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
                border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              width: 250,
              height: 50,
              child: Row(
                children: [
                  Text(' Gender: ',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text(data['details']['gender'],style: TextStyle(
                    fontSize: 20,
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
                border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
              ),

            ),
            Container(

              margin: EdgeInsets.only(top: 20,left: 20),
              width: 300,
              height: 50,
              child: Row(
                children: [
                  Text(' Admission Time: ',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text(data['details']['admissiontime'].toString().substring(0,11),style: TextStyle(
                    fontSize: 20,
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
                border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
              ),

            ),
            SizedBox(height: 20,),
            RaisedButton.icon(
              elevation: 20,
              color: Colors.orange,
              icon: Icon(Icons.local_hospital),
              label: Text('Monitor this Patient',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,

              ),),
              onPressed: () {
                Navigator.of(context).pushNamed(MonitorPatient.routeName,arguments: {
                  'rno': data['details']['regnumber']
                });
              },
            )

          ],
        ),
      ),
    );
  }
}
