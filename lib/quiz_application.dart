import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 2,
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 0,
    },
    {
      "question": "Who is the founder of Amazon?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
    },
    {
      "question": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 3,
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
    },
  ];

  MaterialStateProperty<Color> responseColor(int index) {
    if (selectedAns != -1) {
      if (index == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (index == selectedAns) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.black);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.black);
    }
  }

  bool isQuestionPage = true;
  int questionIndex = 0;
  int selectedAns = -1;

  Scaffold displayPage() {
    if (isQuestionPage) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Question ${questionIndex + 1} / ${allQuestions.length}",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Question : ${allQuestions[questionIndex]["question"]}",
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(7),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAns == -1) {
                    setState(() {
                      selectedAns = 0;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: responseColor(0),
                ),
                child: Text(
                  allQuestions[questionIndex]["options"][0],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(7),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAns == -1) {
                    setState(() {
                      selectedAns = 1;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: responseColor(1),
                ),
                child: Text(
                  allQuestions[questionIndex]["options"][1],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(7),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAns == -1) {
                    setState(() {
                      selectedAns = 2;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: responseColor(2),
                ),
                child: Text(
                  allQuestions[questionIndex]["options"][2],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(7),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAns == -1) {
                    setState(() {
                      selectedAns = 3;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: responseColor(3),
                ),
                child: Text(
                  allQuestions[questionIndex]["options"][3],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return displayPage();
  }
}
