import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        // show an alert dialog with the final score
        int totalScore = scoreKeeper.length;
        int correctAnswers = 0;
        for (Icon icon in scoreKeeper) {
          if (icon.color == Colors.green) {
            correctAnswers++;
          }
        }
        String message =
            "You got $correctAnswers out of $totalScore questions correct.";

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Quiz Complete"),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text("Restart Quiz"),
                  onPressed: () {
                    setState(() {
                      quizBrain.reset();
                      scoreKeeper = [];
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 41, 33, 33), // <-- set the background color
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
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
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    checkAnswer('A');
                  },
                  child: Text(
                    quizBrain.getChoiceA(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    checkAnswer('B');
                  },
child: Text(
quizBrain.getChoiceB(),
style: TextStyle(
fontSize: 20.0,
color: Colors.white,
),
),
),
),
SizedBox(
height: 10.0,
),
Expanded(
child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary: Colors.orange,
onPrimary: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(
Radius.circular(20),
),
),
),
onPressed: () {
checkAnswer('C');
},
child: Text(
quizBrain.getChoiceC(),
style: TextStyle(
fontSize: 20.0,
color: Colors.white,
),
),
),
),
SizedBox(
height: 10.0,
),
Expanded(
child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary: Colors.orange,
onPrimary: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(
Radius.circular(20),
),
),
),
onPressed: () {
checkAnswer('D');
},
child: Text(
quizBrain.getChoiceD(),
style: TextStyle(
fontSize: 20.0,
color: Colors.white,
),
),
),
),
SizedBox(
height: 10.0,
),
Row(
children: scoreKeeper,
),
],
),
),
),
);
}
}