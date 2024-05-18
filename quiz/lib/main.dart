import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> quizzes = [
    'General Knowledge',
    'Math Quiz',
    'Science Quiz',
    'History Quiz',
  ];

  void _startQuiz(BuildContext context, [String? quiz]) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen(quiz: quiz)),
    );
  }

  void _startRandomQuiz(BuildContext context) {
    final random = Random();
    final randomQuiz = quizzes[random.nextInt(quizzes.length)];
    _startQuiz(context, randomQuiz);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.lightBlue.shade100,
      ),
      body: Container(
        color: Colors.white10,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Available Quizzes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        quizzes[index],
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () => _startQuiz(context, quizzes[index]),
                    );
                  },
                ),
              ),
              
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(120),
                
                child: ElevatedButton(
                  onPressed: () => _startRandomQuiz(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 24),
                  ),
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String? quiz;

  QuizScreen({this.quiz});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    _questions = _getQuestions(widget.quiz);
  }

  List<Question> _getQuestions(String? quiz) {
    if (quiz == 'General Knowledge') {
      return [
        Question('What is the capital of France?',
            ['Paris', 'London', 'Berlin', 'Madrid'], 0),
        Question('Which planet is known as the Red Planet?',
            ['Earth', 'Mars', 'Jupiter', 'Venus'], 1),
        Question('Who painted the Mona Lisa?',
            ['Van Gogh', 'Picasso', 'Da Vinci', 'Rembrandt'], 2),
        Question('What is the largest ocean on Earth?',
            ['Atlantic', 'Indian', 'Arctic', 'Pacific'], 3),
        Question('Who wrote "To be, or not to be"?',
            ['Shakespeare', 'Hemingway', 'Fitzgerald', 'Orwell'], 0),
        Question('What is the chemical symbol for water?',
            ['H2O', 'CO2', 'O2', 'N2'], 0),
        Question('What is the smallest prime number?', ['1', '2', '3', '4'], 1),
        Question('Which country gifted the Statue of Liberty to the USA?',
            ['France', 'England', 'Spain', 'Italy'], 0),
        Question(
            'What is the speed of light?',
            ['300,000 km/s', '150,000 km/s', '450,000 km/s', '600,000 km/s'],
            0),
        Question('Who is known as the father of computers?',
            ['Newton', 'Einstein', 'Turing', 'Galileo'], 2),
      ];
    } else if (quiz == 'Math Quiz') {
      return [
        Question('What is 2 + 2?', ['3', '4', '5', '6'], 1),
        Question('What is 5 x 5?', ['20', '25', '30', '35'], 1),
        Question('What is the square root of 64?', ['6', '7', '8', '9'], 2),
        Question('What is 10 / 2?', ['2', '3', '5', '6'], 2),
        Question('What is 7 - 3?', ['3', '4', '5', '6'], 1),
        Question('What is 3^2?', ['6', '7', '8', '9'], 3),
        Question('What is 6 * 7?', ['42', '43', '44', '45'], 0),
        Question('What is 15 % 4?', ['1', '2', '3', '4'], 1),
        Question('What is 1 + 1?', ['1', '2', '3', '4'], 1),
        Question('What is 9 / 3?', ['1', '2', '3', '4'], 2),
      ];
    } else if (quiz == 'Science Quiz') {
      return [
        Question('What planet is known as the Red Planet?',
            ['Earth', 'Mars', 'Jupiter', 'Saturn'], 1),
        Question('What is the chemical symbol for water?',
            ['H2O', 'CO2', 'O2', 'N2'], 0),
        Question(
            'What is the speed of light?',
            ['300,000 km/s', '150,000 km/s', '450,000 km/s', '600,000 km/s'],
            0),
        Question('Who developed the theory of relativity?',
            ['Newton', 'Einstein', 'Turing', 'Galileo'], 1),
        Question('What is the boiling point of water?',
            ['90°C', '95°C', '100°C', '105°C'], 2),
        Question('What is the hardest natural substance on Earth?',
            ['Gold', 'Iron', 'Diamond', 'Silver'], 2),
        Question('What planet is closest to the sun?',
            ['Earth', 'Mars', 'Mercury', 'Venus'], 2),
        Question('What is the powerhouse of the cell?',
            ['Nucleus', 'Ribosome', 'Mitochondria', 'Chloroplast'], 2),
        Question('What gas do plants absorb from the atmosphere?',
            ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'], 2),
        Question('What element does "O" represent on the periodic table?',
            ['Osmium', 'Oxygen', 'Oganesson', 'Osmium'], 1),
      ];
    } else if (quiz == 'History Quiz') {
      return [
        Question(
            'Who was the first President of the United States?',
            [
              'Abraham Lincoln',
              'George Washington',
              'John Adams',
              'Thomas Jefferson'
            ],
            1),
        Question('In what year did the Titanic sink?',
            ['1902', '1912', '1922', '1932'], 1),
        Question(
            'Who discovered America?',
            [
              'Christopher Columbus',
              'Marco Polo',
              'Ferdinand Magellan',
              'James Cook'
            ],
            0),
        Question(
            'What war was fought between the North and South regions in the United States?',
            [
              'World War I',
              'World War II',
              'The Civil War',
              'The Revolutionary War'
            ],
            2),
        Question(
            'Who was the first man to step on the moon?',
            [
              'Buzz Aldrin',
              'Yuri Gagarin',
              'Neil Armstrong',
              'Michael Collins'
            ],
            2),
        Question('What ancient civilization built the pyramids?',
            ['Romans', 'Greeks', 'Egyptians', 'Mesopotamians'], 2),
        Question(
            'Who was the main author of the Declaration of Independence?',
            [
              'John Adams',
              'Benjamin Franklin',
              'Thomas Jefferson',
              'George Washington'
            ],
            2),
        Question('In which year did World War II end?',
            ['1942', '1945', '1948', '1950'], 1),
        Question(
            'Who was known as "The Iron Lady"?',
            [
              'Margaret Thatcher',
              'Indira Gandhi',
              'Golda Meir',
              'Angela Merkel'
            ],
            0),
        Question(
            'Which empire was known as the "Sick Man of Europe"?',
            [
              'Austrian Empire',
              'Russian Empire',
              'Ottoman Empire',
              'British Empire'
            ],
            2),
      ];
    } else {
      return [];
    }
  }

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz ?? 'Quiz'),
      ),
      body: Container(
        color: Colors.lightBlue.shade50,
        child: Stack(
          children: [
            if (_currentQuestionIndex < _questions.length) ...[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _questions[_currentQuestionIndex].text,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      _questions[_currentQuestionIndex].options.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ElevatedButton(
                          onPressed: () => _answerQuestion(index),
                          child: Text(
                              _questions[_currentQuestionIndex].options[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Score: $_score/${_questions.length}',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;

  Question(this.text, this.options, this.correctAnswerIndex);
}
