import 'questionbook.dart';

class QuizBrain {
  
  final List<questionbook> _questionbank = [
    questionbook(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    questionbook(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    questionbook(
      questionText: 'A slug\'s blood is green.',
      questionAnswer: true,
    ),
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

  String getQuestionText(int questionNumber) {
    return _questionbank[questionNumber].questionText;
  }
  
  int getQuestionLength() {
    return _questionbank.length;
  }

  bool getQuestionAnswer(int questionNumber) {
    return _questionbank[questionNumber].questionAnswer;
  }
}
