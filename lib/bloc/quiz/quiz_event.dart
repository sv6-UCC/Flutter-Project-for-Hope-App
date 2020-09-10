part of 'quiz_bloc.dart';

/*
WORK IN PROGRESS
*/


abstract class QuizEvent {}


class QuestionAnswered extends QuizEvent {
  QuizQuestion q;
  int a;
  QuestionAnswered(this.q, this.a);
}

class HelpPressed extends QuizEvent {}

class NextPressed extends QuizEvent {}

class BackPressed extends QuizEvent {}

