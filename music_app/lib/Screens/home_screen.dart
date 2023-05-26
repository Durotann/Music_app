import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.0, top: 20.0),
          child: Image.asset(
            "images/Group 1770.png",
            scale: 3.0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.0, top: 20.0),
            child: Image.asset(
              "images/Rectangle 651.png",
              scale: 3.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Discover",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 8.0),
              child: Text(
                "What do you want to hear?",
                style: TextStyle(color: Colors.white24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
