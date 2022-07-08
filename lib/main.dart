import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/question.dart';
import 'package:flutter_app/reset_question_button.dart';
import 'package:flutter_app/right_or_wrong_button.dart';
import 'package:flutter_app/score.dart';
import 'firebase_options.dart';
import 'constants.dart';
import 'pair_question_and_answer_model.dart';

Future<void> main() async {
  // https://firebase.flutter.dev/docs/overview/ : ensure WidgetsFlutterBinding is initialized and then initialize Firebase:
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionsIndex = 0;
  int _score = 0;
  List<PairQuestionAndAnswer> questions = QUESTIONS;
  int _questionAnswered = -1;

  void _isAnswerCorrect(bool userAnswer) {
    String fact = questions[_questionsIndex].fact;
    final int currentScore;
    if (questions[_questionsIndex].keyAnswer == userAnswer) {
      fact = fact.replaceAll('True', 'Right').replaceAll('False', 'Right');
      currentScore = questions[_questionsIndex].rightScore;
    } else {
      fact = fact.replaceAll('False', 'Wrong').replaceAll('True', 'Wrong');
      currentScore = questions[_questionsIndex].wrongScore;
    }

    final String correction = 'you\'re $fact - you get score $currentScore';
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(correction),
    // ));

    _moreAboutThisFact(correction, currentScore);
    setState(() {
      _questionAnswered += 1;
    });
  }

  void _resetQuestion() {
    setState(() {
      _questionsIndex = 0;
      _score = 0;
    });
  }

  void _moreAboutThisFact(String fact, int currentScore) async {
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: SizedBox(
            width: 1000,
            child: Text(fact),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _score += currentScore;
                });
                Navigator.pop(context, true);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("your score"),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("$_score",
                  style: TextStyle(
                      fontSize: 40,
                      color: _score >= 1 ? Colors.blue : Colors.red)),
            ),
            _questionsIndex != questions.length
                ? QuestionWidget(question: questions[_questionsIndex].question)
                : ScoreWidget(score: _score)
          ],
        ),
      ),
      bottomSheet: LayoutBuilder(builder: (context, constraints) {
        if (_questionsIndex != questions.length &&
            _questionsIndex != _questionAnswered) {
          return RightOrWrongButton(isAnswerCorrect: _isAnswerCorrect);
        } else if (_questionsIndex != questions.length &&
            _questionsIndex == _questionAnswered) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _questionsIndex += 1;
                    });
                  },
                  child: const Text("Next"))
            ],
          );
        } else {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ResetQuestionButton(resetQuestion: _resetQuestion)]);
        }
      }),
    );
  }
}
