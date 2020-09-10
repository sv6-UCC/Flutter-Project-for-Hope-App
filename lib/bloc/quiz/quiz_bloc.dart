import 'dart:async';
import 'package:bloc/bloc.dart';
import 'quiz_question.dart';
part 'quiz_event.dart';
part 'quiz_state.dart';

/*
NOTE - This is very much a work in progress. The whole quiz implementation may change drastically. 

The principles below however are good and should be used in any further models.
*/

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizState get initialState => QuizInitial(QuizQuestion(question: tempQuestions[0][0], answers: tempQuestions[0][1], correctAnswer: tempQuestions[0][2], resultMsg: tempQuestions[0][3] ));
  QuizQuestion current;
  int counter = 1;

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is QuestionAnswered) {
      if (event.q.isCorrectAnswer(event.a)) {
        yield QuizResult(event.q, true);
      } else {
        yield QuizResult(current, false);
      }
    } else if (event is NextPressed) {
      if (counter<tempQuestions.length) {
        current = QuizQuestion(question: tempQuestions[counter][0], answers: tempQuestions[counter][1], correctAnswer: tempQuestions[counter][2], resultMsg: tempQuestions[counter][3]);
        counter+=1;
        yield QuizNext(current);
      } else {
        yield QuizOver();
      }
    } else if (event is HelpPressed) {
      yield QuizHelp();
    } else if (event is BackPressed) {
      //should be new state here for quizback?
      yield QuizNext(current); 
    }
  }
}

// Hardcoded questions, Firebase methods should go here
List tempQuestions =  [
  ["Q1 out of 18: She was lauded throughout Europe but not so much in Cork where they decided that she was only suitable to help the garden grow.", ["Queen Victoria", "Queen Elizabeth II", "Margaret Thatcher", "Margaret Rose"], 0, ""],
  ["Q2 out of 18: They wept and gathered for their lost Lord. This spring date started the demise of a young scribe.", ["30th March 1920", "3rd March 1910", "4th April 1922", "10th April 1934"], 0, ""],
  ["q4", ["a1", "a2", "a3", "a4"], 3, ""],
  ["q5", ["a1", "a2", "a3", "a4"], 2, ""],
  ["q6", ["a1", "a2", "a3", "a4"], 3, ""],
  ["q7", ["a1", "a2", "a3", "a4"], 2, ""],
  ["q8", ["a1", "a2", "a3", "a4"], 1, ""],
  ["q9", ["a1", "a2", "a3", "a4"], 2, ""],
  ["q10", ["a1", "a2", "a3", "a4"], 3, ""],
  ["q11", ["a1", "a2", "a3", "a4"], 1, ""],
  ["q12", ["a1", "a2", "a3", "a4"], 2, ""],
];