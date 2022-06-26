import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'button.dart';
import 'firebase_options.dart';

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

class PairQuestionAndAnswer {
  String question;
  String fact;
  bool? keyAnswer;

  PairQuestionAndAnswer(
      {required this.question, required this.fact, this.keyAnswer});
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionsIndex = 0;
  List<PairQuestionAndAnswer> questions = [
    PairQuestionAndAnswer(
        question: 'The atomic number for lithium is 17',
        fact: 'False - it\'s 3',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'A cross between a horse and a zebra is called a \'Hobra\'',
        fact:
            'False - A male zebra and a female horse is called a \'zorse\', and a female zebra and a male horse is called a \'zonkey\'',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'The black box in a plane is black',
        fact: 'False - they\'re actually orange',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Alliumphobia is a fear of garlic',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'Sex Education star Gillian Anderson was born in Chicago, Illinois',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Prince Harry is taller than Prince William',
        fact: 'False - Prince William is 1.91m, Prince Harry is 1.86m',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'The star sign Aquarius is represented by a tiger',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Meryl Streep has won two Academy Awards',
        fact:
            'False - she\'s won three! She won Best Actress for The Iron Lady in 2012, Best Actress for Sophie\'s Choice in 1983, Best Supporting Actress for Kramer vs. Kramer in 1980.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Marrakesh is the capital of Morocco',
        fact: 'False - it\'s Rabat',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'Idina Menzel sings \'let it go\' 20 times in \'Let It Go\' from Frozen',
        fact: 'False - she sings it 21 times!',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'Waterloo has the greatest number of tube platforms in London',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'M&M stands for Mars and Moordale',
        fact: 'False - M&M stands for Mars and Murrie',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Gin is typically included in a Long Island Iced Tea',
        fact:
            'True - as is vodka, white rum, lemon juice, triple sec, sugar syrup and Coca-Cola',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'The unicorn is the national animal of Scotland',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'There are two parts of the body that can\'t heal themselves',
        fact: 'False - thee\'s only one: the teeth.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Howard Donald is the oldest member of Take That',
        fact:
            'True - He was born in 1968, while Jason Orange was born in 1970, Gary Barlow was born in 1971, Mark Owen in 1972 and Robbie Williams in 1974.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'The Great Wall of China is longer than the distance between London and Beijing',
        fact:
            'True - London to Beijing is only 8,136 km, The Great Wall of China is 21,196.18 km',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'There are 219 episodes of Friends',
        fact: 'False - there are 236',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            '\'A\' is the most common letter used in the English language',
        fact:
            'False - \'E\' is the most common letter and appears in 11 percent of all english words, according to Oxford Dictionaries',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'A lion\'s roar can be heard up to eight kilometres away',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'In Harry Potter, Draco Malfoy has no siblings',
        fact: 'False - Skylar Malfoy is his younger sister',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Louis Walsh is older than Simon Cowell',
        fact:
            'True - at the time of writing, Louis Walsh is 67 while Simon Cowell is 60',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Monaco is the smallest country in the world',
        fact: 'False - Vatican City is, with only 0.44 sq.km.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            '\'What Do You Mean\' was Justin Bieber\'s first UK number one single',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'The river Seine in Paris is longer than the river Thames in London',
        fact: 'True - The Seine is 777km, while the Thames is 346km',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'A cara cara navel is a type of orange',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'There are five different blood groups',
        fact: 'False - There are four: A, B, AB, and O',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Cinderella was the first Disney princess',
        fact:
            'False - Snow White and the Seven Dwarfs was released first in December 1937',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'ASOS stands for As Seen On Screen',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'The Battle Of Hastings took place in 1066',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'H&M stands for Hennes & Mauritz',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Canis lupur is the scientific name for a wolf',
        fact: 'False - It\'s Canis lupus',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'K is worth four points in Scrabble',
        fact: 'False - It\'s worth five',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Alaska is the biggest American state in square miles',
        fact:
            'True - It spans a total area of 665,384 square miles. Texas comes in next with a total area of 268,596 square miles.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Ariana Grande is 25 or under',
        fact: 'False - she turned 26 on 25 June 2019',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Australia is wider than the moon',
        fact:
            'True - The moon sits at 3400km in diameter, while Australia\'s diameter from east to west is almost 4000km',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'Queen Elizabeth II is currently the second longest reigning British monarch',
        fact:
            'False - Queen Elizabeth II became the longest-reigning British monarch on 9 September 2015 when she surpassed the reign of her great-great-grandmother Victoria.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Madonna\'s real name is Madonna',
        fact: 'True - Madonna Louise Ciccone in full',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',
        fact:
            'True - As of June 2020, Venus has won 49 singles titles, and Serena has won 72.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Alexander Fleming discovered penicillin',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Harry Styles\' middle name is Edward',
        fact: 'True - Harry Edward Styles was born on February 1, 1994.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Your \'radius\' bone is in your leg',
        fact: 'False - it\'s one of the biggest bones in your forearm',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Coffee is made from berries',
        fact:
            'True - When coffee berries turn from green to bright red in colour, this indicaties ripeness and they are picked, processed, and dried, before being roasted and turned into coffee.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Drag Race\'s Michelle Visage is older than RuPaul',
        fact:
            'False - As of January 2021, RuPaul is 60 years old, and Michelle is 52.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'The only letter not in the periodic table is the letter J',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'Jordan North won I\'m A Celebrity... Get Me Out Of Here! in 2020',
        fact: 'False - he came runner up to Giovanna Fletcher',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'The small intestine is about three-and-a-half times the length of your body',
        fact:
            'True - it\'s the longest section of your digestive tube, measuring about 22 feet (or seven meters) on average, or three-and-a-half times the length of your body',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'An octopus has three hearts',
        fact:
            'True - an octopus has one main, systemic heart to pumps blood around its body. The two additional hearts are responsible for pumping blood over each of its gills.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Thomas Edison discovered gravity',
        fact:
            'False - Isaac Newton discovered Gravity when he saw a falling apple while thinking about the forces of nature. Thomas Edison is thought to have invented the lightbulb..',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Walt Disney holds the record for the most Oscars',
        fact:
            'True - he won 26 Academy Awards (four of which were honorary) and was nominated a grand total of 59 times throughout his career',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Spaghetto is the singular word for a piece of spaghetti',
        fact:
            'True - generally, Italian words ending in "o" are singular and words ending in "i" are plural. Lots of spaghetto makes spaghetti.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Venus is the hottest planet in the solar system',
        fact:
            'True - Venus has an average surface temperature of around 450° C. Mercury is closer to the sun, but has no atmosphere to regulate temperature it has a very large temperature fluctuation.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Hillary Clinton and Celine Dion are related',
        fact: 'False',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Cardi B\'s real name is Cardigan Backyardigan',
        fact:
            'False - that was a meme. Her real name is Belcalis Marlenis Almánzar.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'Bananas are curved because they grow upwards towards the sun',
        fact:
            'True! A process called \'negative geotropism\' means the fruit grows upwards to break through the canopy.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'The five rings on the Olympic flag are interlocking',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Fish cannot blink', fact: 'True', keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Friends star Lisa Kudrow was originally cast in Frasier',
        fact:
            'True - She was cast to play Roz but was sacked after just one episode.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Goldfish have a two second memory',
        fact: 'False - Their memories can actually last for months.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: '50 Cent and Charlie Chaplin were alive at the same time',
        fact:
            'True - Chaplin died when 50 Cent was about two and a half years old.',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'There are 14 bones in a human foot',
        fact: 'False - There are 28 bones in each foot.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Hot and cold water sound the same when poured.',
        fact:
            'False - They sound different due to the fact that hot water has a higher viscosity than cold water.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'There have been seven million pound winners on Who Wants to Be a Millionaire.',
        fact:
            'False - There are actually six, since one - Charles Ingram - was ruled to have cheated.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'Meghan Markle\'s first name is Rachel.',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'In Finding Nemo the protagonist is a pufferfish.',
        fact: 'False - He\'s a clownfish.',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question: 'In a deck of cards, the king has a mustache.',
        fact: 'False',
        keyAnswer: false),
    PairQuestionAndAnswer(
        question:
            'When the two numbers on opposite sides of a dice are added together it always equals 7.',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question:
            'In the English language there is no word that rhymes with orange.',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Hippos sweat a red substance.',
        fact: 'True',
        keyAnswer: true),
    PairQuestionAndAnswer(
        question: 'Sex and the City star Kim Cattrall is from California.',
        fact: 'False - She\'s actually from Liverpool.',
        keyAnswer: false),
  ];

  void _isAnswerCorrect(bool userAnswer) {
    switch (questions[_questionsIndex].keyAnswer) {
      case true:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("you're Right"),
        ));
        break;
      case false:
        String fact = questions[_questionsIndex].fact;
        fact = fact.replaceAll('False', 'Wrong');
        String correction = 'you\'re $fact';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(correction),
        ));
        break;
      default:
        throw Exception();
    }
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
              onPressedCallback: () => _isAnswerCorrect(true), child: const Text('Correct')),
          MyButton(
              onPressedCallback: () => _isAnswerCorrect(false), child: const Text('Wrong')),
        ],
      ),
    );
  }
}
