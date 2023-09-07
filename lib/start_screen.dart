import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {Key? key}) : super(key: key);
  // Make startQuiz can use this anywhere in this class
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF1450A3),
        Color(0xFF337CCF),
      ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 300,
              width: 300,
              // Don't use opacity use transparency instead to change opaque
              color: Color.fromARGB(181, 255, 255, 255),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text("Learn Flutter the fun way!",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: (() {
                    startQuiz();
                  }),
                  label: const Text("Start Quiz"),
                  icon: Icon(Icons.edit),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF191D88), onPrimary: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
