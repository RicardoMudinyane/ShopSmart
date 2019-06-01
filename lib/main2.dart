  import 'package:flutter/material.dart';
  import 'package:shop_smart/bottom_navabar.dart';
  import 'package:shop_smart/screens/home.dart';
  import 'package:shop_smart/screens/shop.dart';
  import 'package:shop_smart/screens/mylist.dart';
  import 'package:shop_smart/screens/settings.dart';
  import 'package:shop_smart/screens/page.dart';


  class MyHome2 extends StatefulWidget {

    @override
    MyHome2State createState() => MyHome2State();
  }

  class MyHome2State extends State<MyHome2> {

    var pageIndex = 2;
    PageController pageController = PageController();

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Shop Smart") ,backgroundColor: Colors.deepPurple[800], centerTitle: true,),


        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(
                accountEmail: new Text("1355115@students.wits.ac.za"),
                accountName: new Text("Ricardo Mudinyane"),

                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://d2935z6y6s92pm.cloudfront.net/wp-content/uploads/2013/06/Cars.jpg'),
                  ),
                  onTap: () => print("This is your current account."),
                ),
              ),

              new ListTile(
                  title: new Text("Profile"),
                  trailing: new Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("My Profile")));
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

        body: Container(

                child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    children: <Widget>[
                      MainPage(),
                      ShopPage(),
                      PageTwo(),
                      SettingsPage(),
                    ]),
              ),
              bottomNavigationBar: ExpandingBottomBar(

                navBarHeight: 60.0,
                items: [
                  ExpandingBottomBarItem(
                    icon: (Icons.home),
                    text:('Home'),
                    selectedColor: Colors.blue[800],

                  ),
                  ExpandingBottomBarItem(
                    icon: (Icons.category),
                    text:('Shops'),
                    selectedColor: Colors.pink[800]

                  ),
                  ExpandingBottomBarItem(
                    icon: (Icons.reorder),
                    text:('My List'),
                    selectedColor:Colors.purple[800]
                  ),
                  ExpandingBottomBarItem(
                    icon: (Icons.settings),
                    text:'Settings',
                    selectedColor:Colors.cyan[800]

                  ),
                ],
                selectedIndex: pageIndex,
                onIndexChanged: navigationTapped,
              ),
      );
    }

    void onPageChanged(int value) {
      setState(() {
        pageIndex = value;
      });
    }

    void navigationTapped(int value) {
      pageController.animateToPage(value,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
