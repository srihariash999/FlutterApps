import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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



  QuizBrain quizBrain = QuizBrain();

var alertStyle =  AlertStyle(
   animationType: AnimationType.grow,
  isCloseButton: true,
  isOverlayTapDismiss: true,

);

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
                //The user picked true.
                setState(() {


                  if(quizBrain.isFinished() == true)
                    {
                      Alert(context: context,
                        style: alertStyle,
                        type: AlertType.info,
                        title: "Quiz Over",
                        desc:  'Your score is: $quizBrain.score',
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Click to restart",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              setState(() {
                                quizBrain.score =0;
                                quizBrain.restartQuiz();
                              });
                            },

                          ),
                        ] ,
                      ).show();
                    }
                  else {
                    if (quizBrain.getQuestionAnswer() == true) {
                      quizBrain.scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                      quizBrain.score++;
                    }

                    else {
                      quizBrain.scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                  }

                  quizBrain.nextQuestion();
                });

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
                setState(() {

                  if(quizBrain.isFinished() == true)
                  {
                    Alert(context: context,
                        style: alertStyle,
                        type: AlertType.info,
                        title: "Quiz Over",
                        desc: 'Your score is: $quizBrain.score',

                        buttons: [
                          DialogButton(
                            child: Text(
                              "Click to restart",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              setState(() {
                                quizBrain.score = 0;
                                quizBrain.restartQuiz();
                              });
                            },

                          ),
                        ] ,
                    ).show();
                  }
                  else {
                    if(quizBrain.getQuestionAnswer() == false)
                    {quizBrain.scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    quizBrain.score++;
                    }

                    else
                    {quizBrain.scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    }

                  }

                  quizBrain.nextQuestion();

                });
              },
            ),
          ),
        ),
        Row(
          children: quizBrain.scoreKeeper,
        ),
      ],
    );
  }
}

