// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/material.dart';
import 'dart:math' ;

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
   createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    var randomIntegerNumber=0,randomDounbleNumber=0.0 ;
  int nextNumber(int min,int max) {
    setState(() {
      if(!min.isNegative&&!max.isNegative){
     randomIntegerNumber=(min + Random().nextInt(max - min + 1)).toInt();} 
     if (min.isNegative || max.isNegative) {
        randomIntegerNumber = (min - Random().nextInt(max - min + 1)).toInt();
      }

    }); 
  return randomIntegerNumber;
  }

  double nextDoubleNumber(double min, double max) {
    setState(() {
      if (!min.isNegative && !max.isNegative ) {
        randomDounbleNumber = (min +(max-min) *Random().nextDouble()).toDouble() ;
      }
      if (min.isNegative || max.isNegative) {
        randomDounbleNumber = (min - (max-min)*Random().nextDouble()).toDouble();
      }
    });
    return randomDounbleNumber ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:Padding(padding: EdgeInsets.only(top: 30.0,left: 100.0),child:Text('Random number',style: TextStyle(color: Colors.white,fontSize: 30.0),),),
        
      ),
      body:Center(child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Randomly Generated Number Integer: ',style: TextStyle(fontSize: 20.0),),
          Text(
              '$randomIntegerNumber',
              style: TextStyle(fontSize: 20.0),
            ),
          Text(
              'Randomly Generated Number Double: ',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '$randomDounbleNumber',
              style: TextStyle(fontSize: 20.0),
            ),
          Container(padding: EdgeInsets.all(20.0),
          child:  Padding(padding: EdgeInsets.only(top: 0.0,right: 10.0),
        child:ElevatedButton(child: Text('Generate',style: TextStyle(fontSize: 25.0,color: Colors.white),),
        onPressed:() {
          nextNumber(3, 100);
          nextDoubleNumber(3.0, 100);
        },
      ),),),
        ],
      ),),
        
    );
  }
}
