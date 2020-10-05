import 'question.dart';
import 'package:flutter/material.dart';



class QuizBrain{

  int score =0;
  int _questionNum = 0;
  List<Icon> scoreKeeper = [];
  List <Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('chelsea will play UCL next season', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('Classicdude is an awesome username', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];

  String getQuestionText()   // Getter function of private list questionBank
  {
    return _questionBank[_questionNum].questionText;
  }


  bool getQuestionAnswer()
  {
    return _questionBank[_questionNum].questionAnswer;
  }

  void nextQuestion()
  {
    if(_questionNum < _questionBank.length - 1)
      {
        _questionNum += 1;
      }
  }

  bool isFinished()
  {
    if(_questionNum == _questionBank.length -1)
      {
        score++;
        return true;
      }
    else
      return false;

  }

  void restartQuiz()
  {
    _questionNum = 0;

    scoreKeeper = [];

  }





} // Class QuizBrain ends
