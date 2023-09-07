import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({Key? key, required this.answerText, required this.onTap})
      : super(key: key);

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              // Background button color
              primary: Color(0xFF191D88),
              // Text in button color
              onPrimary: Color.fromARGB(255, 255, 255, 255),
              // To make your button round
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
