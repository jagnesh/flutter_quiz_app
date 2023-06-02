import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/result_screen/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.selectedAnswer, required this.restartQuiz})
      : super(key: key);
  final List<String> selectedAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswer[i],
        'isTrue': questions[i].answers[0] == selectedAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = summaryData;
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectQuestions =
        summarydata.where((data) => data['isTrue'] as bool).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 80, 40, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberOfTotalQuestions out $numberOfCorrectQuestions questions correctly",
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
              onPressed: restartQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
