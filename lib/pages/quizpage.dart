import 'package:flutter/material.dart';
import '../bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
const nice= const Color(0XFF1C0A30);
class QuizPage extends StatelessWidget with NavigationStates {
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
              width: 700,
              height: 600,
              margin: EdgeInsets.only(top: 44),
              child: FlatButton(

                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),


                onPressed: () {},
                child:Image.asset("images/bigscroll2.png")
              ),
            ),

          FlatButton(
            padding: EdgeInsets.all(125),
            onPressed: () => BlocProvider.of<NavigationBloc>(context)
                .add(NavigationEvents.Q1PageClickedEvent),

            child: new Text('CLUE 1',style: TextStyle(fontSize: 40,color:nice)),
          ),
        ],
      ),
    );
  }
}