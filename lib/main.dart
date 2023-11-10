import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler()
  );
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
),
);
  }
}

class QuizPage extends StatefulWidget {

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget>scoreKeeper = [];
  void checkAnswer( bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below


    if(userPickedAnswer == correctAnswer){
     scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
    }else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    }

    quizBrain.nextQuestion();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  //questions[questionNumber],
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ),
        Expanded(child: Padding(
          padding: EdgeInsets.all(15.0),

          child: TextButton(onPressed: () {
            checkAnswer(true);




          },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green
            ),
          child: Text(
            'True',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),

          ),

        ),
        ),
        Expanded(child: Padding(
          padding: EdgeInsets.all(15.0),

          child: TextButton(onPressed: () {
            checkAnswer(false);

          },
            style: TextButton.styleFrom(
                backgroundColor: Colors.red
            ),
            child: Text(
              'false',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),

          ),

        ),
        ),
        Row(
          children: scoreKeeper,


        )
      ],


    );
  }
}






