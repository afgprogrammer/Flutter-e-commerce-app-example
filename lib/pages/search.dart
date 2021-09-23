import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          height: 45,
          child: TextField(
            autofocus: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintText: "Search e.g Sweatshirt",
              hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: .7,
            child: Container(
              width: double.infinity,
              height: 250, 
              child: Image( image: AssetImage("assets/images/search.png")),
            )
          ),
          SizedBox(height: 40,),
          Text("Type to search ...", style: TextStyle(fontSize: 20),)
        ],
      )
    );
  }
}