import 'package:flutter/material.dart';
import '../bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
const nice= const Color(0XFF1C0A30);
const nice2= const Color(0XFF5A12B6);
class Q1Page extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDFDFDF),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/Q1.jpeg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: 70,
            height: 60,

            margin: EdgeInsets.only(left: 350),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/question-mark-icon.jpg"),
                    fit: BoxFit.cover)),
          ),




          Container(
            width: 700,
            height: 600,
            margin: EdgeInsets.only(top: 44),
            child: FlatButton(

                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),


                onPressed: () {},
                child:Image.asset("images/bigscroll.png")
            ),
          ),
          Container(
            height:320,
            width:250,
            margin: EdgeInsets.only(top:185,left:80),
            color: Colors.white,
            child: new Text("""She was lauded throughout Europe but not so much in Cork where they decided that she was only suitable to help the Garden grow.""",style: TextStyle(fontSize: 23,color:nice2)),
          ),
          Container(
            width: 150,
            height: 60,
            margin: EdgeInsets.only(top: 395,left:120),
            child: FlatButton(

                textColor: Colors.white,
                color:Colors.purple,
                padding: EdgeInsets.all(0.0),


                onPressed: () {},
                child: Text("SUBMIT")
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:340,left:90),
            child:TextField(
              decoration: InputDecoration(

                  hintText: 'Enter answer here',
                  labelStyle: new TextStyle(color: nice2),
                  border: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                  color: nice2
                  )
                  )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:185,left:290),
            child: Icon(
              Icons.remove_red_eye,
              color:Colors.black,
              size:30.0,

            ),
          ),

          FlatButton(
            padding: EdgeInsets.all(125),
            onPressed: () {print("egg");},

            child: new Text('CLUE 1',style: TextStyle(fontSize: 40,color:nice)),
          ),
        ],
      ),
    );
  }
}