import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_ui/Model/users.dart';
import 'package:spotify_ui/screens/album_screen.dart';
import 'package:spotify_ui/songs_json.dart';
import 'package:flutter/services.dart' as Rootbundle;

class Home_UI extends StatefulWidget {
  const Home_UI({Key? key}) : super(key: key);

  @override
  State<Home_UI> createState() => _Home_UIState();
}

class _Home_UIState extends State<Home_UI> {
  Future<List<Users>> readJson() async {
    final jsondata = await Rootbundle.rootBundle
        .loadString('jsonFile/json_file_of_card.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map<Users>((e) => Users.fromJson(e)).toList();
  }

  int activemenu = 0;
  int active_menu2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Explore",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(
                Icons.list,
                color: Colors.white70,
                size: 20,
              )
            ],
          ),
        ),
      ),
      body: getbody(),
    );
  }

  Widget getbody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //smalll scrollview
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(songType1.length, (index) {
                return Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activemenu = index;
                          });
                        },
                        child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: activemenu == index
                                    ? Colors.greenAccent
                                    : Colors.grey),
                            child: Center(
                              child: Text(
                                songType1[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))));
              })),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //card scrollview
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FutureBuilder(
                        future: readJson(),
                        builder: (ctx, data) {
                          if (data.hasError) {
                            return Center(child: Text("${data.error}"));
                          } else if (data.hasData) {
                            var items = data.data as List<Users>;
                            return Row(
                              children: List.generate(
                                items.length,
                                (index) => Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // print(items[index]);
                                          //     Navigator.push(context, PageTransition(child: AlbumPage(song: items[index],),
                                          //         type: PageTransitionType.bottomToTop));
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AlbumPage(song: items[index],)));
                                        },
                                        child: Container(
                                          height: 180,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(items[index]
                                                    .imageUrl
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Colors.greenAccent,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                        ),
                                      )
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      items[index].songName.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                        items[index]
                                            .musicDirectorName
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100)),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        })),
                SizedBox(height: 12),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(songType2.length, (index) {
                return Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            active_menu2 = index;
                          });
                        },
                        child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: active_menu2 == index
                                    ? Colors.greenAccent
                                    : Colors.grey),
                            child: Center(
                              child: Text(
                                songType2[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))));
              })),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FutureBuilder(
                        future: readJson(),
                        builder: (ctx, data) {
                          if (data.hasError) {
                            return Center(child: Text("${data.error}"));
                          } else if (data.hasData) {
                            var items = data.data as List<Users>;
                            return Row(
                              children: List.generate(
                                items.length,
                                (index) => Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: GestureDetector(
                                        onTap: () {

                                        },
                                        child: Container(
                                          height: 180,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(items[index]
                                                    .imageUrl
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Colors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      items[index].songName.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                        items[index]
                                            .musicDirectorName
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100)),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        })),
                SizedBox(height: 12),
              ],
            ),
          )
        ],
      ),
    );
  }
}
