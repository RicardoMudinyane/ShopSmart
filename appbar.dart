import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{

  final double appH = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {


    return new Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Text("Main",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 25.0
                          ),
                        ),
                      )
                  ),


                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.person,color: Colors.white,),
                    ),
                  ),

                ],
              ),

            )
          ],
      )

    );

  }

}