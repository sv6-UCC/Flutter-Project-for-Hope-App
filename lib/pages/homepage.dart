import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';


class HomePage extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFFE3E3E3),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/home_screen.jpeg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: 300,
            height: 100,
            margin: EdgeInsets.only(left: screenWidth*0.53, top: screenHeight /2),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/hope-logo-retina.png"),
            )),
          ),
          Center(
            child: Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.only(top: 390),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(width: 3, color: Colors.white)),
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                color: Colors.red[600],
                onPressed: () => BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationEvents.QuizPageClickedEvent),
                child: Text(
                  "Start Quiz",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
