import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'button.dart';
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
  List<PairQuestionAndAnswer> questions = QUESTIONS;

  void _isAnswerCorrect(bool userAnswer) {
    String fact = questions[_questionsIndex].fact;
    if (questions[_questionsIndex].keyAnswer == userAnswer) {
      fact = fact.replaceAll('True', 'Right').replaceAll('False', 'Right');
    } else {
      fact = fact.replaceAll('False', 'Wrong').replaceAll('True', 'Wrong');
    }
    String correction = 'you\'re $fact';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(correction),
    ));
    setState(() {
      if (_questionsIndex == questions.length - 1) {
        _questionsIndex = 0;
        return;
      }
      _questionsIndex++;
    });
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
            Text(questions[_questionsIndex].question),
          ],
        ),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
              onPressedCallback: () => _isAnswerCorrect(true),
              child: const Text('Correct')),
          MyButton(
              onPressedCallback: () => _isAnswerCorrect(false),
              child: const Text('Wrong')),
        ],
      ),
    );
  }
}
