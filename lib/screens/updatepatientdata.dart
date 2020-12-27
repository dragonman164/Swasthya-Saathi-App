import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UpdateData extends StatefulWidget {
  static String routeName = '/updatePatientDetails';



  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

  TextEditingController _rno, _temp , _pulse;

  @override
  void initState() {

    _rno = TextEditingController();
    _temp = TextEditingController();
    _pulse = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _rno.dispose();
    _temp.dispose();
    _pulse.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Patient Details',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [

              Text('Enter current status of Patient:',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
                  controller: _rno,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.contacts,color: Colors.red,),
                    hintText: 'Registration No',
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
                  controller: _pulse,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.check,color: Colors.red,),
                    hintText: 'Pulse Rate',
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
                  controller: _temp,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.texture,color: Colors.red,),
                    hintText: 'Temperature',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton.icon(
                padding: EdgeInsets.all(13),
                icon: Icon(Icons.opacity,color: Colors.black,),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.pink,width: 2)
                ),
                color: Colors.deepOrange,
                label: Text('Submit....',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                onPressed: () async{
                  try {
                    var url = 'http://192.168.1.7:8000/patientsstatusapi/${_rno
                        .text.toString()}';
                    var data = {
                      'pulserate': _pulse.text.toString(),
                      'temperature': _pulse.text.toString(),
                    };
                    var response = await http.post(
                        url, body: json.encode(data));
                    var data1 = json.decode(response.body);
                    if (data1["message"] == "Registration Number invalid!")
                   showAlert(context, 'Registration Number invalid!');
                    else
                      showAlert(context, 'Data Updated Successfully');
                  }catch(e)
                  {
                    showAlert(context, e.toString());
                  }

                },
              )
            ],
          ),
        ),
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
