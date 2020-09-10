import 'package:flutter/material.dart';
import '../bloc/navigation_bloc.dart';

class GalleryPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

        title: new Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: new Text("Gallery"),
        ),
          backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(20.0),
        children: List.generate(4, (index) {
          return Center(
              child: FlatButton(
                  onPressed: null,
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset("images/Q$index.jpeg")),
          ); //robohash.org api provide you different images for any number you are giving
        }),
      ),
    );
  }
}