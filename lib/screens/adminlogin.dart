import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'admindashboard.dart';

class AdminLoginScreen extends StatefulWidget {
  static String routeName = '/adminLogin';
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {

//  String _username,_password;
final _auth = FirebaseAuth.instance;
  TextEditingController _UserName,_Password;
bool _loading = false;



@override
  void initState() {
    // TODO: implement initState
    _UserName = TextEditingController();
    _Password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _UserName.dispose();
    _Password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login ',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             margin: EdgeInsets.only(top:30,left: 30),
             child: Image(image: AssetImage('assets/heart.png'),
             height: 250,
             width: 250,
             ),
           ),
            Text('Admin Login',style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            Container(
              margin: EdgeInsets.only(top: 30,left: 30),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextFormField(
                controller: _UserName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.email,color: Colors.red,),
                hintText: 'Email',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,top: 10),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextFormField(
                controller: _Password,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.lock,color: Colors.black,),
                  hintText: 'Password',
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              elevation: 10,
              color: Colors.pink,
              child:  Text('Login',style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),),
              onPressed: () async {


                try{
                  setState(() {
                    _loading = true;
                  });
                  final newUser = await _auth.signInWithEmailAndPassword(email:
                  _UserName.text.toString(), password: _Password.text.toString());

                  if(newUser != null)
                    {
                      print('Success');
                    }
                  setState(() {
                    _loading = false;
                  });
                  Navigator.of(context).pushNamed(AdminDashboard.routeName);

             }catch(e)
                {
                showAlert(context,e.toString());
                }
              },

            ),

        _loading?SpinKitRotatingCircle(
          color: Colors.orange,
        ):Text('')
          ],
        ),
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