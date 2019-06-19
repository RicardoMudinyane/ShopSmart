import 'package:flutter/material.dart';

class Rewards extends StatefulWidget{

  @override
  _RewardState  createState() => _RewardState();
}

class _RewardState extends State<Rewards> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(title: new Text("Rewards")),

      body:

      Container(
        alignment: Alignment.bottomCenter,
        child:  Stack(
          fit: StackFit.expand,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    height: 250,
                    width: 350,



                  ),
                ],
              )
            ),

            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Column(
                children: <Widget>[
                  MyCards(),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: ApplyButton(),
              ),
            ),
          ],
        ),
      ),



    );
  }
}

Widget ApplyButton(){
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(100.0),
    ),

    child: RaisedButton(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("Redeem", style: TextStyle(color: Colors.white, fontSize: 18.0),),
          ),
          IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white,),
              onPressed: null)
        ],
      ),
      onPressed: () { },
    ),
  );
}

class MyCards extends StatefulWidget{

  final Function onChanged;
  MyCards({this.onChanged});

  @override
  MyCardState createState() => MyCardState();
}

class MyCardState extends State<MyCards> with SingleTickerProviderStateMixin  {

  var cards = [
    CouponCard(
        index:0, color1: Colors.purpleAccent, color2: Colors.deepPurple,
        couponImage:"https://cdn.shopify.com/s/files/1/0051/1577/3041/files/airtime_large.JPG?v=1541341605",
        coupomTitle:"Get Any network Airtime", couponDetails: "R12.00 - 3 000 points"),

    CouponCard(
        index:1, color1: Colors.blueAccent, color2: Colors.cyan,
        couponImage:"https://mybroadband.co.za/news/wp-content/uploads/2013/11/Ster-Kinekor.png",
        coupomTitle:"Get A free Ticket ", couponDetails: "1 Ticket - 10 000 points"),

    CouponCard(
        index:2, color1: Colors.lightGreen, color2: Colors.green,
        couponImage:"https://i2.wp.com/agfundernews.com/wp-content/uploads/2016/01/Mcdonalds-90s-logo.svg_.png?resize=672%2C372&ssl=1",
        coupomTitle:"Discount on a meal", couponDetails: "R25 - 5 000 points"),
  ];

  int currentIndx;
  AnimationController controller;
  CurvedAnimation curvedAnimation;
  Animation<Offset> animation;

  @override
  void initState(){
    super.initState();
    currentIndx = 0;

    controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 150),
    );
    curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut
    );
    animation = Tween(begin: Offset(0.0, 0.05),end: Offset(0.0, 0.0)).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      overflow:  Overflow.visible,
      children: cards.reversed.map((card){
        if (cards.indexOf(card) <= 2){
          return GestureDetector(
            onHorizontalDragEnd: couponDrag,
            child: FractionalTranslation(
              translation: stackedCard(card),
              child: card,
            ),
          );
        }
        else{
          return Container();
        }
      }).toList());
  }

  Offset stackedCard(CouponCard card){
    int diff = card.index - currentIndx;

    if (card.index == currentIndx+1){
      return animation.value;
    } else if (diff > 0 && diff <= 2){
      return Offset(0.0,0.05*diff);
    } else {
      return Offset(0.0,0.0);
    }
  }

  void couponDrag (DragEndDetails details){
    controller.reverse().whenComplete((){
      setState(() {
        controller.reset();
        CouponCard removedCard = cards.removeAt(0);
        cards.add(removedCard);
        currentIndx = cards[0].index;
      });
    });
  }
}

class CouponCard extends StatelessWidget {
  final int index;
  final Color color1, color2;
  final String couponImage, couponDetails, coupomTitle;

  CouponCard(
      {this.index, this.color1, this.color2, this.couponImage, this.coupomTitle, this.couponDetails});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(50.0),
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(50.0),
      ),

      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
        gradient: new LinearGradient(colors: [color1,color2],
          begin: Alignment.centerRight,
          end: new Alignment(-1.0, -1.0),
        ),
      ),

        child:

        Column(

          children: <Widget>[

            SizedBox(height: 20.0),
            Container(
              child: CircleAvatar(
                backgroundColor: color1,
                backgroundImage: NetworkImage(couponImage),
                radius: 75.0,
              ),
            ),

            SizedBox(height: 20.0),
            Container(child: Text(coupomTitle, style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),),),

            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Text(couponDetails, style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),),),
            ),

          ],
        ),

      ),
    );
  }
}