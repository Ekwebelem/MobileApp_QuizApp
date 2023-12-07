import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/start_screen.dart';



class Quiz extends StatefulWidget{
  const Quiz({super.key});
@override
State<Quiz> createState() {
  return _QuizState();
}
}


class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
   var activeScreen = 'start-screen';
  //  var activeScreen = 'results-screen';


  //  alternative
  // Widget? activeScreen;

  // @override
  // void initState() {
  //  activeScreen = StartScreen(switchScreen);
  //   super.initState();
   //}

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void reStartQuiz() {
    setState(() {
        selectedAnswers = [];
        activeScreen = 'questions-screen';
      });
  }

  @override 
   Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen == 'questions-screen') {
    screenWidget =  QuestionsScreen(
      onSelectedAnswer: chooseAnswer);
  }


  if (activeScreen == 'results-screen') {
    screenWidget =  ResultsScreen(
      chosenAnswers: selectedAnswers,
      onRestart: reStartQuiz,
      );
  }
      return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 75, 23, 165),
                Color.fromARGB(255, 190, 152, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              ),
              child: screenWidget,
              // activeScreen == 'start-screen' 
              //     ? StartScreen(switchScreen) 
              //     : const QuestionsScreen(),
              ),
              ),
    );
}
}