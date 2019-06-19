import 'package:flutter/material.dart';

class MyBalance extends StatelessWidget{

  final double appH = 66.0;
  const MyBalance();

  @override
  Widget build(BuildContext context) {

    final double statusAppBAr = MediaQuery.of(context).padding.top;


    return new Container(
      padding: new EdgeInsets.only(top: statusAppBAr),
      height: statusAppBAr+appH,

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    child: new Text("Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0
                    ),
                  ),
                  ),


                  Container(
                    child: new Text("R2200.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 28.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 16.0),

                          child: new Text("change plan",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14.0
                            ),
                          )
                        ),
                      ],
                    ),
                  )

                ],
              ),

            )
          ],
        ),
      ),
    );

  }

}