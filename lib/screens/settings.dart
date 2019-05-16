import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //appBar: new AppBar(title: new Text(title), backgroundColor: Colors.redAccent,),

        body: GestureDetector(
            child: Center(
              child: Text('Open route')),

            onVerticalDragUpdate: (dragUpdateDetails) {

                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));

            }),


    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: GestureDetector(
          child: Center(
              child: Text('second route')),
          onVerticalDragUpdate: (dragUpdateDetails) {

            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));

          }),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
