import 'package:flutter/material.dart';
import 'package:quizzler/questionbank.dart';

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

  List<Icon> scoreKeeper = [];

  QuestionBank questionBank = QuestionBank();

  bool _isButtonDisabled;
  String _questionText;
  int _correctAnswer;
  int _wrongAnswer;

  @override
  void initState()
  {
    super.initState();
    _isButtonDisabled = false;
    _questionText = questionBank.nextQuestion;
    _correctAnswer = 0;
    _wrongAnswer = 0;
  }

  void setScore(bool expectedAnswer, bool userAnswer)
  {
    setState(() {

      if(expectedAnswer == userAnswer)
        {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
          _correctAnswer++;
        }
      else {
        scoreKeeper.add(Icon(Icons.clear, color: Colors.red,));
        _wrongAnswer++;
      }

        //Check if the test is complete
      if(questionBank.quizComplete)
        {
          _isButtonDisabled = true;
          _questionText = 'You have successfully completed the quiz';
        }
      else
        {
          _questionText = questionBank.nextQuestion;
        }
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
                _questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !questionBank.quizComplete,
          child: Expanded(
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
                onPressed: (){
                  //check the answer to the question and then move to the next question
                  setScore(questionBank.checkAnswer, true);
                  //The user picked true.
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: !questionBank.quizComplete,
          child: Expanded(
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
                  setScore(questionBank.checkAnswer, false);
                  if(questionBank.quizComplete)
                  {

                  }
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: !questionBank.quizComplete,
          child: Row(
            children: scoreKeeper,
          ),
        ),
        Visibility(
          visible: questionBank.quizComplete,
          child: Text(
            'Correct Answers: $_correctAnswer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: questionBank.quizComplete,
          child: Text(
            'Wrong Answers: $_wrongAnswer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
