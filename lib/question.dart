import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'answer_button.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionsStete();
}

class _QuestionsStete extends State<Question> {
  var currenQuestionIndex =0;

  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currenQuestionIndex ++;
    });
  }

  @override
  Widget build(BuildContext context) {
  final currenQuestion = questions[currenQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currenQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
                fontWeight: FontWeight.bold,
               fontSize: 20,
               ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          ...currenQuestion.shufledAnswers.map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: AnswerButton(
                  answerText: e,
                  onPressed: () => answerQuestion(e),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
