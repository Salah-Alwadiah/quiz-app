import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summatyData, {super.key});

  final List<Map<String, Object>> summatyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summatyData.map((e) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          foregroundColor: Colors.black,
                          backgroundColor:
                          e['user_answer'] == e['correct_answer']
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          child:
                              Text(((e['question_index'] as int) + 1).toString()),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['question'].toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                e['user_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(125, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e['correct_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 19, 32, 138),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
