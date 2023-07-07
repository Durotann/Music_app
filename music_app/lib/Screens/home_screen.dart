import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_app/Models/ApiService.dart';

import '../Models/music.dart';

var _music = <Music>[];

class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    super.initState();
    getMusic();
  }

  Future<void> getMusic() async {
    final musics = await ApiService().getAllFetchMusicData();
    setState(() {
      _music = musics;
    });
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.0, top: 24.0),
            child: Text(
              "Discover",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.0, top: 8.0),
            child: Text(
              "What do you want to hear?",
              style: TextStyle(color: Colors.white54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
            child: Container(
              width: 327,
              height: 48,
              decoration: BoxDecoration(
                color: Color.fromRGBO(25, 22, 38, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                  child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color.fromRGBO(255, 255, 255, 0.6),
                    border: OutlineInputBorder(),
                    hintText: "Search music",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0),
            child: Text(
              "Popular Releases",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 24.0),
            child: Container(
              width: 500,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _music.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Container(
                          width: 260,
                          height: 176,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: Image.network(
                                        _music[index].image.toString())
                                    .image,
                                fit: BoxFit.cover,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 86.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 8.0),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      width: 244,
                                      height: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              _music[index].title.toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              _music[index].artist.toString(),
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.60)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0, left: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recently playlist",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            height: 100,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                  child: Container(
                    width: 400,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(25, 22, 38, 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
