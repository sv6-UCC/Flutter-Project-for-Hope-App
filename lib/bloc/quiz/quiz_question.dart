
import 'package:meta/meta.dart';

/* 
WORK IN PROGRESS
*/

class QuizQuestion {
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final String resultMsg;

  QuizQuestion({
    @required this.question,
    @required this.answers,
    @required this.correctAnswer,
    @required this.resultMsg
  });

  bool isCorrectAnswer(int a) {
    if (a==correctAnswer) {
      return true;
    } else {
      return false;
    }
  }
}
