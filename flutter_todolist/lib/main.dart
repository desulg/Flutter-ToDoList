import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp(
    firstLine: new Text("First Line"),
    secondLine: new Text("second line"),
  ));

}

class MyApp extends StatelessWidget {
  MyApp({this.firstLine, this.secondLine});
  final Widget firstLine, secondLine;

  @override
  Widget build (BuildContext ctxt){
    return new MaterialApp(
      title:"MyApplication",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("My App"),
        ),
        body: new Column(
          children: <Widget>[
            this.firstLine,
            this.secondLine,
          ],
        )
      )
    );
  }
}