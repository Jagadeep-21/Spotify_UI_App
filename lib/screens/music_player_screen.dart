import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final dynamic title;
  // final Color color;
  final dynamic Description;
  final dynamic img;
  // final String songUrl;

  MusicPlayerScreen(
      {Key? key,
      required this.title,
      required this.Description,
      required this.img})
      : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double _currSliderChanged = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: getbody(),
    );
  }

  Widget getbody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            //for blur radius
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Container(
                  height: size.width - 60,
                  width: size.width - 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 50,
                          offset: Offset(-5, 20))
                    ],
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            //for Image
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Container(
                  height: size.width - 60,
                  width: size.width - 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.img), fit: BoxFit.cover),
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.folder_copy,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.Description,
                        maxLines: 1,
                        style: TextStyle(fontSize: 19, color: Colors.white38),
                      )
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white70,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Slider(
              value: _currSliderChanged,
              min: 0,
              max: 200,
              activeColor: Colors.greenAccent,
              onChanged: (value) {
                setState(() {
                  print(value.toString());
                  _currSliderChanged = value;
                });
              }),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_currSliderChanged.toStringAsFixed(2) + "sec"),
                Text((200 - _currSliderChanged).toStringAsFixed(2) + "sec")
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
                  IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.greenAccent,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 35,
                            color: Colors.white70,
                          ),
                        ),
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.queue_music_outlined)),
                ],
              ))
        ],
      ),
    );
  }
}
