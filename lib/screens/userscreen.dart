import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'userdetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserStatusScreen extends StatefulWidget {
  static String routeName = '/userStatus';

  @override
  _UserStatusScreenState createState() => _UserStatusScreenState();
}

class _UserStatusScreenState extends State<UserStatusScreen> {
  TextEditingController _regNumber;
  bool _loading = false;

  @override
  void initState() {
    _regNumber = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _regNumber.dispose();
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
            title: Text('Check Patient Status',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 280,
                  margin: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 5, color: Colors.black, style: BorderStyle.solid),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/patient.jpg'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5,left: 30),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[300],
                  ),
                  child: TextFormField(
                  controller: _regNumber,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.confirmation_number,color: Colors.red,),
                      hintText: 'Patient\'s Registration Number' ,
                    ),
                    keyboardType: TextInputType.text,
             textCapitalization: TextCapitalization.characters,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                RaisedButton.icon(
                  padding: EdgeInsets.all(13),
                  label: Text(
                    'Check Patient\'s Status',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  icon: Icon(
                    Icons.local_hospital,
                    color: Colors.black,
                  ),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.pink, width: 2)),
                  color: Colors.deepOrange,
                  onPressed: () async{
                    try {
                      _loading = true;
                      setState(() {

                      });
                      var url = 'http://192.168.1.7:8000/patientsdataapi';
                      var response =
                      await http.get(url);
                      var check;
                      List <dynamic>data = json.decode(response.body);
                      data.forEach((element) {
                        if (element["regnumber"] == _regNumber.text.toString())
                          check = element;
                      });

                      if(check == null)
                        showAlert(context,'Patient not found!! Please Check Registration Number');
                      else
                      Navigator.of(context).pushNamed(UserDetails.routeName,arguments: {
                        'details':check
                      });

                    }catch(e)
                    {
                      showAlert(context, e);
                    }
                    _loading = false;
                    setState(() {

                    });

                  },
                ),
                _loading?SpinKitRotatingCircle(
                  color: Colors.orange,
                ):Text('')
              ],

            ),
          ),
//        resizeToAvoidBottomInset: false,
      ),
    );
  }
}


void showAlert(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error while Signing In"),
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