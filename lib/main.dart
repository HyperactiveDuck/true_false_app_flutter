import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

void main() {
  runApp(const MainApp());
}

QuizBrain quizBrain = QuizBrain();
int questionNumber = 0;

void answerCheck(bool x) {
  if (quizBrain.getQuestionAnswer(questionNumber) == x) {
    scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
  } else {
    scoreKeeper.add(
      const Icon(Icons.close, color: Colors.red),
    );
  }
}

Column questionBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Text(
          quizBrain.getQuestionText(questionNumber),
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    ],
  );
}

List<Icon> scoreKeeper = [];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 119, 119, 119),
          appBar: AppBar(
            title: const Text('Quizzer'),
            backgroundColor: const Color.fromARGB(255, 39, 39, 39),
            centerTitle: true,
          ),
          body: const AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  ElevatedButton buttonFunc(Color color, bool a, String b) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(175, 100),
        backgroundColor: color,
        textStyle: const TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        setState(() {
          answerCheck(a);
        });
        debugPrint('You have chosen True');
        questionNumber++;
        if (questionNumber == quizBrain.getQuestionLength()) {
          Alert(
                  context: context,
                  title: "Test is over",
                  desc: "Forwarding to beginning.")
              .show();
          questionNumber = 0;
          scoreKeeper = [];
        }
      },
      child: Text(b),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: questionBody(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonFunc(Colors.green, true, 'True'),
              buttonFunc(Colors.red, false, 'False'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
