import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/patientmonitor.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonitorPatient extends StatefulWidget {

  static String routeName = '/monitorPatient';

  @override
  _MonitorPatientState createState() => _MonitorPatientState();
}

class _MonitorPatientState extends State<MonitorPatient> {






  List _graphData;
  bool _getData = false;
List<TableRow> _tableData = [
  TableRow(children: [
    Text(' Pulse Rate',style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),),
    Text(' Temperature',style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),),
    Text(' Time',style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),),
  ]),

];


  List<charts.Series<PatientMonitor, int>> _createSampleData(List data1) {
    int time = 0;
    final data = List.generate(data1.length, (index) => PatientMonitor(
      pulseRate: data1[index]['pulserate'],
      temperature: data1[index]['temperature'],
      time: ++time
    ));

    return [
    new charts.Series<PatientMonitor, int>(
    id: 'Pulse',
    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    domainFn: (PatientMonitor pat, _) => pat.pulseRate.toInt(),
    measureFn: (PatientMonitor pat, _) =>pat.time,

    data: data,
    )
    ];
  }


  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Current Patient Status',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: !_getData?Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Text('Click on Refresh Button to fetch Latest Data',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
              children: [
                Container(
                    width: 400,
                    margin: EdgeInsets.only(top: 20,left: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Table(
                      border: TableBorder.all(color: Colors.white,width: 2),
                      children: _tableData,
                    ),
                  ),
                SizedBox(height: 20,),
              SizedBox(
                  height: 200,
                  child: charts.LineChart(_createSampleData(_graphData)))
              ],

            ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.orange,
        onPressed: () async{
          var url = 'http://192.168.1.7:8000/patientsstatusapi/${data['rno']}';
          var response = await http.get(url);
          _getData = true;
         _graphData = json.decode(response.body);
         setState(() {
           _tableData.clear();
           _tableData = [
             TableRow(children: [
               Text(' Pulse Rate',style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),),
               Text(' Temperature',style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),),
               Text(' Time',style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),),
             ]),
           ];
          _tableData.addAll(List.generate(_graphData.length, (index) =>TableRow(
            children: [
              Text(_graphData[index]['pulserate'].toString(),style: TextStyle(
                  color: Colors.white
              ),),
              Text(_graphData[index]['temperature'].toString(),style: TextStyle(
                  color: Colors.white
              ),),
              Text(_graphData[index]['time'].toString(),style: TextStyle(
                  color: Colors.white
              ),),

            ],)
          )
          );
          print(_graphData[0]['time']);
         });

        },
      ),
    );
  }
}


