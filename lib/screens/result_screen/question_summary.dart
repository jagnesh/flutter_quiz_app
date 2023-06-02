import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData
          .map(
            (data) => Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    (data['isTrue'] as bool)
                        ? Icons.thumb_up
                        : Icons.thumb_down,
                    color: (data['isTrue'] as bool) ? Colors.green : Colors.red,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(data['question'] as String),
                      Text(data['correct_answer'] as String),
                      Text(data['user_answer'] as String),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
