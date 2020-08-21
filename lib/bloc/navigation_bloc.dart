import 'package:bloc/bloc.dart';
import '../pages/homepage.dart';
import '../pages/quizpage.dart';
import '../pages/gallerypage.dart';
import '../pages/donatepage.dart';
import '../pages/settingspage.dart';
import '../pages/aboutpage.dart';
import '../pages/q1.dart';

/* 
Simple enum for all of the different pages in the app.
*/
enum NavigationEvents {
  HomePageClickedEvent,
  QuizPageClickedEvent,
  GalleryPageClickedEvent,
  DonatePageClickedEvent,
  SettingsPageClickedEvent,
  AboutPageClickedEvent,
  Q1PageClickedEvent
}

/*
Initialise an empty abstract state class for use with Bloc.
*/
abstract class NavigationStates {} 

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  /*
  Set page to be HomePage when app first starts
  */
  @override
  NavigationStates get initialState => HomePage(); 

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    /*
    Switch statement for all of the different Events in the enum above.
    An occurence of an Event yields a new State.

    This is a basic state solution as we are only calling a new page.
    The quiz implementation will be more challenging.
    */
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.QuizPageClickedEvent:
        yield QuizPage();
        break;
      case NavigationEvents.GalleryPageClickedEvent:
        yield GalleryPage();
        break;
      case NavigationEvents.DonatePageClickedEvent:
        yield DonatePage();
        break;
      case NavigationEvents.SettingsPageClickedEvent:
        yield SettingsPage();
        break;
      case NavigationEvents.AboutPageClickedEvent:
        yield AboutPage();
        break;
      case NavigationEvents.Q1PageClickedEvent:
        yield Q1Page();
        break;
    }
  }
}