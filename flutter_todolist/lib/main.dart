import 'package:flutter/material.dart';




void main(){
  runApp(new MyApp(
    title: new Text("ToDo List"),
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
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;
  List<String> textList = [];
  List<bool> textChkBox = [];


  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white
              )
          )
      ),
      home: new Scaffold(
        appBar: new AppBar(
            title: widget.title,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_comment),
                onPressed: () {
                  setState(() {
                    showDialog = true;
                  });
                }
              ),
            new IconButton(
                icon: new Icon(Icons.remove),
                onPressed: () {
                  int counter = 0;
                  while(counter < textList.length){
                    if(textChkBox[counter] == true){
                      textChkBox.removeAt(counter);
                      textList.removeAt(counter);
                      counter = 0;
                    } else {
                      counter++;
                    }
                  }
                  setState(() {

                  });
                }
            )
          ],
        ),

        body: new Column(
          children: <Widget>[
            new Text("Add your list of things to do"),
            showDialog ==  true?
            new AlertDialog(
              title: new Text("Add things to do"),
              content: new TextField(
                controller: eCtrl,
                decoration: new InputDecoration.collapsed(hintText: "Enter text here"),
                maxLines: 3,
                onSubmitted: (String text) {


                },
              ),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      setState(() {
                        if (eCtrl.text == ""){
                          showDialog = false;
                        } else {
                          showDialog = false;
                          textList.add(eCtrl.text);
                          textChkBox.add(false);
                          eCtrl.clear();
                        }
                      });
                    },
                    child: new Text("OK")
                )
              ],
            ) : new Text(""),
            new Flexible(
              child: new ListView.builder(
                itemCount: textList.length,
                itemBuilder: (BuildContext ctxt, int index){
                  return new Row(
                    children: <Widget>[
                      new Checkbox(
                        value: textChkBox[index],
                        onChanged: (bool newValue){
                          textChkBox[index] = newValue;
                          setState(() {

                          });
                        },
                      ),
                      new Text(textList[index])
                    ],
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}