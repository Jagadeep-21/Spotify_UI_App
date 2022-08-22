
import 'package:flutter/material.dart';
import 'Home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int activeTab=0;
  final iconsList =[
    Icons.home,
    Icons.search,
    Icons.library_add_rounded,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getbody(),

      bottomNavigationBar:getFooter()
    );
  }
  Widget getbody(){
    return IndexedStack(
      index: activeTab,
      children: const [
      Home_UI(),
        Center(
          child: Text("Home",style: TextStyle(fontSize: 30),),
        ),
        Center(
          child: Text("Home",style: TextStyle(fontSize: 30),),
        ),
        Center(
          child: Text("Home",style: TextStyle(fontSize: 30),),
        ),

      ],
    );
  }
  Widget getFooter (){
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:List.generate(
                iconsList.length, (id) => IconButton(
                onPressed: (){
                  setState((){
                    activeTab=id;
                  });
                },
                icon: Icon(iconsList[id]),
                color: activeTab==id?Colors.green:Colors.white70)
            )
        ),
      )
    );
  }
}



