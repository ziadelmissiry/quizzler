import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank= [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];

  void nextQuestion(){
    if (_questionNumber <_questionBank.length -1){
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }


}