import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hope_app/bloc/navigation_bloc.dart';
import 'package:hope_app/bloc/quiz/quiz_bloc.dart';

/*

Work in progress

See how I yield different widgets based on the current state. This how we should do it for every page".

*/

// need to test if Navigation States is needed here
class QuizPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<QuizBloc>(context),
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizNext) {
            return QuestionWidget();
          } else if (state is QuizHelp) {
            return HelpWidget();
          } else if (state is QuizResult) {
            if (state.result) {
              return ResultWidget("Correct");
            } else {
              return ResultWidget("Wrong");
            }
          } else if (state is QuizOver) {
            return OverWidget();
          } else if (state is BackPressed) {
            return QuestionWidget();
          } else if (state is QuizInitial) {
            return QuestionWidget();
          } else
            return Text("A state has not been implemented");
        },
      ),
    );
  }
}

class HelpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<QuizBloc>(context).add((BackPressed()));
        },
        child: Text("help\n\nBack",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
      ),
    ));
  }
}

class ResultWidget extends StatelessWidget {
  final String result;

  ResultWidget(this.result);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
            child: GestureDetector(
          onTap: () {
            BlocProvider.of<QuizBloc>(context).add((NextPressed()));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2.5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[600],
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0)
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red[100],
                    Colors.red[200],
                    Colors.red[300],
                    Colors.red[400]
                  ],
                ),
              ),
              child: Text("\n$result \n\nMessage after question will go here...\n\n This UI will change.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26, ))),
        ));
      },
    );
  }
}

class OverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Quiz Over",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
    ));
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: <Widget>[
                Container(
                  height: 75,
                  child: ButtonTheme(
                    minWidth: screenWidth * .15,
                    child: RaisedButton(
                      onPressed: () {
                        BlocProvider.of<QuizBloc>(context).add((HelpPressed()));
                      },
                      elevation: .0,
                      color: Colors.white,
                      child: Text("?", style: TextStyle(fontSize: 22)),
                      padding: EdgeInsets.all(3.0),
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .85,
                  height: screenHeight * .33,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[600],
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red[100],
                            Colors.red[200],
                            Colors.red[300],
                            Colors.red[400]
                          ])),
                  child: Column(children: <Widget>[
                    SizedBox(height: 30),
                    BlocBuilder<QuizBloc, QuizState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${state.question.question}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        );
                      },
                    ),
                  ]),
                ),
                SizedBox(
                  height: screenHeight * .067,
                ),
                BlocBuilder<QuizBloc, QuizState>(
                  builder: (context, state) {
                    return Column(children: <Widget>[
                      QuizAnswer(
                        id: 0,
                        answer: state.question.answers[0],
                        onTap: () {
                          BlocProvider.of<QuizBloc>(context)
                              .add((QuestionAnswered(state.question, 0)));
                        },
                      ),
                      QuizAnswer(
                        id: 1,
                        answer: state.question.answers[1],
                        onTap: () {
                          BlocProvider.of<QuizBloc>(context)
                              .add((QuestionAnswered(state.question, 1)));
                        },
                      ),
                      QuizAnswer(
                        id: 2,
                        answer: state.question.answers[2],
                        onTap: () {
                          BlocProvider.of<QuizBloc>(context)
                              .add((QuestionAnswered(state.question, 2)));
                        },
                      ),
                      QuizAnswer(
                        id: 3,
                        answer: state.question.answers[3],
                        onTap: () {
                          BlocProvider.of<QuizBloc>(context)
                              .add((QuestionAnswered(state.question, 3)));
                        },
                      )
                    ]);
                  },
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizAnswer extends StatelessWidget {
  /* 
  A simple class to create a custom clickable menu item for use
  in the sidebar.
  */
  final int id;
  final String answer;
  final Function onTap;

  const QuizAnswer({Key key, this.id, this.answer, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context)
        .size
        .width; //need to set these as globals somewhere eventually
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: screenWidth * .85,
          height: screenHeight * .07,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1.5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[600],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[100],
                    Colors.grey[200],
                    Colors.grey[300],
                    Colors.grey[400]
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                Text(
                  "${id + 1}:",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  answer,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
