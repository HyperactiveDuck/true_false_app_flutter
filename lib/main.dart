import 'package:flutter/material.dart';
import 'package:true_false_app_demo/questionbook.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MainApp());
}

int questionNumber = 0;
List<questionbook> questionbank = [
  questionbook(
      questionText: 'You can lead a cow down stairs but not up stairs.',
      questionAnswer: false),
  questionbook(
      questionText: 'Approximately one quarter of human bones are in the feet.',
      questionAnswer: true),
  questionbook(questionText: 'A slug\'s blood is green.', questionAnswer: true),
  questionbook(
      questionText: 'Some cats are actually allergic to humans',
      questionAnswer: true),
  questionbook(
      questionText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      questionAnswer: true),
  questionbook(
      questionText: 'It is illegal to pee in the Ocean in Portugal.',
      questionAnswer: true),
  questionbook(
      questionText:
          'No piece of square dry paper can be folded in half more than 7 times.',
      questionAnswer: false),
  questionbook(
      questionText:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral.',
      questionAnswer: true),
  questionbook(
      questionText:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      questionAnswer: false),
  questionbook(
      questionText:
          'The total surface area of two human lungs is approximately 70 square metres.',
      questionAnswer: true),
  questionbook(
      questionText: 'Google was originally called "Backrub".',
      questionAnswer: true),
  questionbook(
      questionText:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      questionAnswer: true),
  questionbook(
      questionText:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      questionAnswer: true),
  questionbook(
      questionText:
          'The average person walks the equivalent of three times around the world in a lifetime.',
      questionAnswer: true),
  questionbook(
      questionText:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral.',
      questionAnswer: true),
];

void answerCheck(bool x) {
  if (questionbank[questionNumber].questionAnswer == x) {
    scoreKeeper.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  } else {
    scoreKeeper.add(
      const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }
}

Column questionBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Text(
          questionbank[questionNumber].questionText,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
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
  ElevatedButton buttonFunc(Color color , bool a , String b) {
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
        if (questionNumber == questionbank.length) {
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
            )),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonFunc(Colors.green, true, 'True'),
              buttonFunc(Colors.red, false, 'False' ),
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
