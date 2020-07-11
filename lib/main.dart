import 'package:flutter/material.dart';
import 'Questions.dart';

void main() => runApp(Quizzler());

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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
//  List<String> questions = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.',
//  ];
//  List<bool> answers=[
//    false,
//    true,
//    true,
//    true,
//  ];
  bool answerboolean;
  List<Questions> questionbank = [
    Questions(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Questions(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Questions(q: 'A slug\'s blood is green.', a: true),
    Questions(q:'Some cats are actually allergic to humans',a: true),
    Questions(q: 'You can lead a cow down stairs but not up stairs.',a: false),
    Questions(q: 'Approximately one quarter of human bones are in the feet.',a: true),
    Questions(q: 'A slug\'s blood is green.',a: true),
    Questions(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',a: true),
    Questions(q: 'It is illegal to pee in the Ocean in Portugal.',a: true),
    Questions(q:
        'No piece of square dry paper can be folded in half more than 7 times.',a:
        false),
    Questions(q:
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',a:
        true),
    Questions(q:
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',a:
        false),
    Questions(q:
        'The total surface area of two human lungs is approximately 70 square metres.',a:
        true),
    Questions(q: 'Google was originally called \"Backrub\".',a: true),
    Questions(q:
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',a:
        true),
    Questions(q:
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',a:
        true),
  ];
  List<Icon> validanswer = [];
  void checkanswer(bool userpicked, int tracker) {
    setState(() {
      if (userpicked == questionbank[tracker].answer) {
        validanswer.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        validanswer.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
    track++;
  }

  int track = 0;
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
                questionbank[track].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                answerboolean = true;
                checkanswer(answerboolean, track);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                answerboolean = false;
                checkanswer(answerboolean, track);
              },
            ),
          ),
        ),
        Row(
          children: validanswer,
        )
      ],
    );
  }
}
/*
question1: , false,
question2: , true,
question3: , true,
*/
