import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_ui/Color.dart';
import 'package:spotify_ui/Model/users.dart';
import 'package:flutter/services.dart' as Rootbundle;
import 'package:spotify_ui/screens/music_player_screen.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;
  const AlbumPage({Key? key, this.song}) : super(key: key);
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  bool _isListening = false;

  Future<List<Users>> readJson() async {
    final jsondata = await Rootbundle.rootBundle
        .loadString('jsonFile/json_file_of_card.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map<Users>((e) => Users.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var length_of_song = widget.song.songName;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 230,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.song.imageUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        widget.song.songName.toString().length >= 17
                            ? "${widget.song.songName.toString().substring(0, 13)}...."
                            : widget.song.songName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: clr.green_colour,
                        )),
                    Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Subscribe",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: clr.PrimaryColor,
                                fontSize: 18),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                                            onTap: () {},
                                            child: Container(
                                              height: 180,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[index]
                                                            .imageUrl
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  color: Colors.greenAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          items[index].count.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 6),
                                        Text(items[index].edited_ago.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100)),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            })),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, ind) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: MusicPlayerScreen(
                              title: widget.song.songName,
                              img: widget.song.imageUrl,
                              Description: widget.song.songName
                                  +widget.song.musicDirectorName,
                            ),
                            type: PageTransitionType.bottomToTop),
                      );
                    },
                    child: ListTile(
                      leading: const CircleAvatar(),
                      title: Text(widget.song.songName.toString()),
                      subtitle: Text(widget.song.musicDirectorName.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          print(_isListening);
                          setState(() => _isListening = !_isListening);
                        },
                        icon: Icon(_isListening
                            ? (Icons.stop_sharp)
                            : (Icons.play_arrow)),
                      ),
                    )),
              )
            ],
          ),
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.chevron_left)),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined))
            ],
          )),
        ],
      ),
    );
  }
}
