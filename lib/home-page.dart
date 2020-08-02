import 'package:flutter/material.dart';
import 'quiz.dart';

Quiz quiz = Quiz();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// @todo create the store state

class _HomePageState extends State<HomePage> {
  int userScore = 0;
  int currentQuestionIndex = 0;

  List<Widget> userScores = [];

  void updateProgress(bool userAnswer) {
    // @todo fix an error where last question result is not showing
    int questionsCount = quiz.questionsCount();
    print("current index: $currentQuestionIndex - questions count: $questionsCount");
    if(currentQuestionIndex + 1 >= quiz.questionsCount()) return;

    final success = userAnswer == quiz.getAnswer(currentQuestionIndex);

    if(success) userScore++;

    Widget widget = Container(
      child: Icon(
        success ? Icons.check : Icons.close,
        color: Colors.white,
        size: 20,
      ),
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: success ? Colors.green : Colors.red,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.all(2),
    );
    userScores.add(widget);
    currentQuestionIndex++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                quiz.getQuestion(currentQuestionIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('False'),
                onPressed: () {
                  setState(() {
                    updateProgress(false);
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('True'),
                onPressed: () {
                  // testing
                  setState(() {
                    updateProgress(true);
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Score: $userScore',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: userScores,
          ),
        ),
      ],
    );
  }
}
