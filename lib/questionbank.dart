import 'package:quizzler/question.dart';

class QuestionBank
{
  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  int _currentPosition = 0;

  String get nextQuestion
  {
    if(_currentPosition < _questions.length)
      {
        print('Current Postion: $_currentPosition');
        return _questions[_currentPosition].question;
      }
      return '';
  }

  bool get checkAnswer
  {
    if(_currentPosition < _questions.length)
      {
        //Return the answer and then increment the position
        return _questions[_currentPosition++].answer;
      }
    return false;
  }

  bool get quizComplete
  {
    if(_currentPosition == _questions.length)
      {
        return true;
      }
    return false;
  }

}