import 'package:flutter/material.dart';
class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Library page"
        ,
        style: TextStyle(
          color: Colors.red
        ),),
      ),
    );
  }
}
