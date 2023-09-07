import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summayData, {
    Key? key,
  }) : super(key: key);

  final List<Map<String, Object>> summayData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summayData.map(
            (data) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 35),
                    child: CircleAvatar(
                      backgroundColor: data['correct_answer'] as String ==
                              data['user_answer'] as String
                          ? const Color(0xFF337CCF)
                          : Color.fromARGB(255, 148, 9, 9),
                      child: Text(
                          // Just set for text can readable
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),

                  // Use Expanded is make the widget inside the row can't expand width or height more than the row
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(data['user_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(123, 255, 255, 255))),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
