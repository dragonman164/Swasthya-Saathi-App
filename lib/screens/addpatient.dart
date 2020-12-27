import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddPatient extends StatefulWidget {
  static String routeName = '/addNewPatient';

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController  fName, lName, roomNumber,address;

  String gender = 'male';


  @override
  void initState() {
    // TODO: implement initState
    fName = TextEditingController();
    lName = TextEditingController();
    roomNumber = TextEditingController();
    address = TextEditingController();

    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose

    fName.dispose();
    lName.dispose();
    roomNumber.dispose();
    address.dispose();

    super.dispose();
  }


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
          title: Text('Add new Patient',style:
            TextStyle(
              fontWeight: FontWeight.bold,
            ),),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40,left: 40),
            child: Column(
              children: [
                Text('We require following details:',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:23,

                ),),

                Container(
                  margin: EdgeInsets.only(top: 30,),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    controller: fName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.contacts,color: Colors.red,),
                      hintText: 'First Name',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30,),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    controller: lName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.contacts,color: Colors.red,),
                      hintText: 'Last Name',

                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
            Container(
              margin: EdgeInsets.only(top: 30,),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: DropdownButton<String>(
              value: gender,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                hint: Text('Select Gender'),
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                  gender = newValue;
                  });
                },
                items: <String>['male','female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
                Container(
                  margin: EdgeInsets.only(top: 30,),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    controller: roomNumber,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.format_list_numbered,color: Colors.red,),
                      hintText: 'Room Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30,),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.home,color: Colors.red,),
                      hintText: 'Address',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.orange,
                child: Text('Submit',style: TextStyle(
                  color: Colors.black
                ),),
                elevation: 5,
                onPressed: () async{

                  try {
                    Map data = {
                      'rnumber': roomNumber.text.toString(),
                      'fname': fName.text.toString(),
                      'lname': lName.text.toString(),
                      'streetaddress': address.text.toString(),
                      'gender': gender
                    };
                    var url = 'http://192.168.1.7:8000/patientsdataapi';
                    var response = await http.post(url, body: json.encode(
                        data));
                    print(response.body);
                    showAlert(context, 'Patient Added Successfully');
                  }catch(e)
                  {
                    showAlert(context, e.toString());
                  }
                },
              )
              ],
            ),

          ),
        )
      ),
    );
  }
}

void showAlert(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Status"),
        content: Text(text),
        actions: [
          RaisedButton(
            child: Text('Go Back'),
            color: Colors.blue,
            elevation: 20,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )
  );
}
