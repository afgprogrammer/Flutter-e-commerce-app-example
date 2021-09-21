import 'dart:convert';

import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  List<dynamic> productList = [];

  Future<void> products() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);

    setState(() {
      productList = data['products']
        .map((data) => Product.fromJson(data)).toList();
    });
  }


  @override
  void initState() { 
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    products();

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          elevation: 0,
          pinned: true,
          floating: true,
          stretch: true,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 100),
            stretchModes: [
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
            title: AnimatedOpacity(
              opacity: _isScrolled ? 0.0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: FadeAnimation(1, Text("Find your 2021 Collections",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ))),
            ),
            background: Image.asset("assets/images/background.png", fit: BoxFit.cover,)
          ),
          bottom: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Expanded(
                  child: FadeAnimation(1.4, Container(
                    height: 50,
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
                  )),
                ),
                SizedBox(width: 10),
                FadeAnimation(1.5, Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, color: Colors.black, size: 30,),
                  ),
                ))
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Products', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('See all ', style: TextStyle(color: Colors.black, fontSize: 14),),
                      ),
                    ],
                  )),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return productCart(productList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 180,
              child: Column(
                children: [
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('For You', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('See all ', style: TextStyle(color: Colors.black, fontSize: 14),),
                      ),
                    ],
                  )),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return forYou(productList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Winter Collection', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('See all ', style: TextStyle(color: Colors.black, fontSize: 14),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return productCart(productList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cotton Collection', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('See all ', style: TextStyle(color: Colors.black, fontSize: 14),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return productCart(productList[index]);
                      }
                    )
                  )
                ]
              )
            ),
          ]),
        )
      ]
    );
  }

  productCart(Product product) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(1.5, Container(
        margin: EdgeInsets.only(right: 20, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.grey.shade200,
          )],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(product.imageURL, fit: BoxFit.cover)),
            ),
            SizedBox(height: 20,),
            Text(product.name,
              style: TextStyle(color: Colors.black, fontSize: 18,),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.brand, style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                Text("\$ " +product.price.toString() + '.00',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  forYou(Product product) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: FadeAnimation(1.5, Container(
        margin: EdgeInsets.only(right: 20, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.grey.shade200,
          )],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(product.imageURL, fit: BoxFit.cover)),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name,
                    style: TextStyle(color: Colors.black, fontSize: 18,),
                  ),
                  SizedBox(height: 5,),
                  Text(product.brand, style: TextStyle(color: Colors.orange.shade400, fontSize: 13,),),
                  SizedBox(height: 10,),
                  Text("\$ " +product.price.toString() + '.00',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ]
              ),
            )
          ],
        ),
      )),
    );
  }
}
