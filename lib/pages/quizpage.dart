import 'package:flutter/material.dart';
import '../bloc/navigation_bloc.dart';

class QuizPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Quiz Goes here",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}