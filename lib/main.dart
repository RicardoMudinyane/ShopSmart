  import 'package:flutter/material.dart';
  import 'package:shop_smart/bottom_navabar.dart';
  import 'package:shop_smart/screens/home.dart';
  import 'package:shop_smart/screens/shop.dart';
  import 'package:shop_smart/screens/mylist.dart';
  import 'package:shop_smart/screens/settings.dart';


  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
    }
  }

  class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {

    var pageIndex = 0;
    PageController pageController = PageController();
    List<String> wallpapers = ['Batman', 'Minimal', 'Apple'];

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }

      @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: Container(

                child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    children: <Widget>[
                      MainPage(),
                      ShopPage(),
                      MyListPage(),
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
                    text:('Settings'),
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
