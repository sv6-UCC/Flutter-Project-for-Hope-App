
part of 'quiz_bloc.dart';


abstract class QuizState {
  QuizQuestion question;
}

class QuizInitial extends QuizState {
  QuizQuestion question;

  QuizInitial(this.question);
}

class QuizNext extends QuizState {
  QuizQuestion question;
  
  QuizNext(this.question);
}

class QuizResult extends QuizState {
  QuizQuestion question;
  bool result;

  QuizResult(this.question, this.result);

}


class QuizHelp extends QuizState {}

class QuizOver extends QuizState {}


