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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),
                  Text("Find your 2021 Collections", style: TextStyle(color: Colors.black, fontSize: 40, height: 1.4),),
                  SizedBox(height: 40,),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            child: TextField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.search, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                                ),
                                hintText: "Search e.g Login Page",
                                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                                
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.filter_list, size: 30,),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
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
