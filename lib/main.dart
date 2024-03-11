import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(QizzlerApp());

class QizzlerApp extends StatelessWidget {
  const QizzlerApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'QuizzlerDom',
            style: TextStyle(
              fontSize: 30.0
            ),
          ),
        ),
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



class QuizPage extends StatefulWidget{
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{

  List <Widget> scoreKeeper = [];

  List<String> questions = [
    'You can lead a cow downstairs but not upstairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  List<bool> answers = [
    false,
    true,
    true
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context){
    print(questionNumber);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: (){
                    bool correctAnswer = answers[questionNumber];
                    if(correctAnswer == true){
                      scoreKeeper.add(
                        Icon(Icons.check,color: Colors.green,),
                      );
                    }else{
                      scoreKeeper.add(
                        Icon(Icons.cancel,color: Colors.red,),
                      );
                    }
                    setState(() {
                      questionNumber++;
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  bool correctAnswer = answers[questionNumber];
                  if(correctAnswer == false){
                    scoreKeeper.add(
                      Icon(Icons.check,color: Colors.green,),
                    );
                  }else{
                    scoreKeeper.add(
                      Icon(Icons.cancel,color: Colors.red,),
                    );
                  }
                  setState(() {
                    questionNumber++;
                  });
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

