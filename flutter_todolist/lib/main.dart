import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp(
    title: new Text("MyApp"),
    someText: new Text("Some text"),

  ));

}

class MyApp extends StatelessWidget {
  MyApp({this.title, this.someText});
  final Widget title, someText;
  int counter = 0;
  bool chkValue = false;

  @override
  Widget build (BuildContext ctxt) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: this.title,
        ),
        body: new Column(
          children: <Widget>[
            this.someText,
            new Text("Counter value => $counter"),
            new FlatButton(
                onPressed: () {
                  counter++;
                },
                child: new Text("AButton")
            ),
            new Checkbox(
                value: chkValue,
                onChanged: (bool newValue) {
                  chkValue = newValue;
                })
          ],
        )
      ),
    );
  }
}