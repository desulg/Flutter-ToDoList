import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp(
    title: new Text("My App"),
    someText: new Text("Some text...")
  ));
}

class MyApp extends StatefulWidget {

  MyApp({this.title, this.someText});
  final Widget title, someText;
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  String text = "";
  @override
  Widget build(BuildContext ctxt){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: widget.title,
          backgroundColor: Colors.orange,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_comment),
                onPressed: () {
                  setState(() {
                    text="Add comment";
                  });
                }
            ),
            new IconButton(
                icon: new Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    text="Remove comment";
                  });
                }
            ),
          ],
        ),
        body: new Column(
          children: <Widget>[
            widget.someText,
            new Text("Text Value => $text")
          ],
        ),
      ),
    );

  }
}