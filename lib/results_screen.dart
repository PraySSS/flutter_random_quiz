import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary.dart';
import 'dart:math' as math;

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {Key? key, required this.chosenAnswers, required this.restart})
      : super(key: key);

  final List<String> chosenAnswers;
  final void Function() restart;

// Use this way to make sure we didn't call the same function twice within the same build method
// For the case you didn't have input or parameter use get name{} is like getter in java
// If you had parameter or input use getSummary(input){}
// Then store it to variable like the code below
// final summaryData = getSummary(input);
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          // Key          : Value
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // Use this way to make sure we didn't call the same function twice within the same build method
    // We will store the value in variable and then reuse the value by using that variable
    // final summaryData = summaryData;
    final numTotalquestion = questions.length;
    // .where is use for search data
    final numCorrectQuestion = summaryData
        // Arrow function delete {} ,return and ; for shorter code
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestion out of $numTotalquestion questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {
                restart();
              },
              label: const Text(
                'Restart Quiz!',
              ),
              icon: const Icon(
                Icons.refresh,
              ),
              style: TextButton.styleFrom(primary: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
