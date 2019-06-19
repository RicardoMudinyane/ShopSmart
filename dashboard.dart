import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'pages.dart';
import 'package:flutter_app/pages/AppBar/appbar.dart';
import 'package:flutter_app/pages/AppBar/balance.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'rewards.dart';


class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  Material myItems (IconData icon, String heading, int color){

    return Material (
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.teal,

      borderRadius: BorderRadius.circular(24.0),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // Text
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading,
                        style: TextStyle(color:
                        new Color(color),
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold)),
                  ),

                  // Icon

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  Material myChart (String tittle, String subheading){

    return Material (
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.teal,

      borderRadius: BorderRadius.circular(24.0),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(tittle,
                        style: TextStyle(color: Colors.blue,
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(subheading,
                        style: TextStyle(color: Colors.blue,
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Sparkline(
                      data: data,
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                      pointColor: Colors.yellow,
                      lineColor: Colors.purple,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Material myProgress (){

    return Material (

      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.teal,

      borderRadius: BorderRadius.circular(24.0),

      child : new Container(
        height: 130.0,
        color: Colors.transparent,

        child: new Container(
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: new BoxDecoration(
                color: Colors.green.withOpacity(0.8),

                borderRadius: new BorderRadius.all(Radius.circular(24.0))),
            child: new Center(
              child: new Text("Keep Learning - 65% ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
              ),
            )),alignment: FractionalOffset.topLeft
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

//    double full_width = MediaQuery.of(context).size.width*1.0;

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountEmail: new Text("1355115@students.wits.ac.za"),
              accountName: new Text("Ricardo Mudinyane"),

              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(''),
                ),
                onTap: () => print("This is your current account."),
              ),
            ),

            new ListTile(
                title: new Text("Personal Details"),
                trailing: new Icon(Icons.account_circle),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("My Profile")));
                }
            ),
            new ListTile(
                title: new Text("Feedback"),
                trailing: new Icon(Icons.feedback),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Feedback")));
                }
            ),
            new ListTile(
                title: new Text("Settings"),
                trailing: new Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Settings")));
                }
            ),
            new ListTile(
                title: new Text("About"),
                trailing: new Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("About Page")));
                }
            ),
            new ListTile(
                title: new Text("Share"),
                trailing: new Icon(Icons.share),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Share")));
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Log-out"),
              trailing: new Icon(Icons.power_settings_new),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 210.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title:  Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background:
//                    MyBalance(),
                    Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ];
          },

          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 12.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                children: <Widget>[

                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Rewards()));
                    },
                    child: myItems(Icons.local_atm, "Rewards", 0xffff8f00),
                  ),

                  InkWell(
                    onTap:(){
                      print("Announcements");
                    },
                    child: myItems(Icons.stars, "Ranks", 0xff1a237e),
                  ),

                  InkWell(
                    onTap:(){
                      print("Upload Documents");
                    },
                    child: myChart("Manage Account", "see progress"),
                  ),

                  InkWell(
                    onTap:(){
                      print("Calendar");
                    },
                    child: myProgress(),

                  ),


                ],
                staggeredTiles:[
                  StaggeredTile.extent(1, 130.0),
                  StaggeredTile.extent(1, 130.0),
                  StaggeredTile.extent(2, 200.0),
                  StaggeredTile.extent(2, 130.0),

                ],
              ),
            ),
          ),
        ),

    );
  }

}



