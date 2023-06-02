import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen/index.dart';
import 'package:quiz_app/screens/result_screen/index.dart';
import 'package:quiz_app/screens/splash_screen/index.dart';
import 'package:quiz_app/widgets/gradiant_view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'splash_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void showResult() {
    setState(() {
      activeScreen = 'results_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'splash_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      showResult();
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = SplashScreen(switchScreen);
    switch (activeScreen) {
      case 'splash_screen':
        screenWidget = SplashScreen(switchScreen);
        break;
      case 'questions_screen':
        screenWidget = QuestionScreen(chooseAnswer);
        break;
      case 'results_screen':
        screenWidget = ResultScreen(
          restartQuiz: restartQuiz,
          selectedAnswer: selectedAnswer,
        );
        break;
    }
    return MaterialApp(
      home: Scaffold(
          body: GradiantView(
        child: screenWidget,
      )),
    );
  }
}
