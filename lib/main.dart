import 'package:day34/pages/explore.dart';
import 'package:day34/pages/notification.dart';
import 'package:day34/pages/profile.dart';
import 'package:day34/pages/search.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _myPage;
  int _selectedPage = 0;

  List<Widget> pages = [
    ExplorePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _myPage.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _myPage = PageController(initialPage: 0);

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _myPage,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_outlined, size: 25),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search, size: 25),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.notifications_outlined, size: 25),
            title: Text('Notifications'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 25,),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
