import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';

import 'summary.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers,
   this.restart, {
    super.key
  });
   
  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get _summatyData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswer = _summatyData.where(
      (element) => element['user_answer'] == element['correct_answer']).length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly!',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Summary(_summatyData),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple[900],
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 40,
              ),
            ),
            onPressed: restart,
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
