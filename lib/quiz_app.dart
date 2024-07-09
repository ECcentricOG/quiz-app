import 'package:flutter/material.dart';
import 'questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool isQuestionPage = false;
  int questionIndex = 0;
  int selectedAns = -1;
  int correctAns = 0;
  bool isStartPage = true;

  void validateNextPage() {
    if (selectedAns == totalQuestion[questionIndex].ans) {
      correctAns++;
    }

    if (selectedAns != -1) {
      if (questionIndex < totalQuestion.length) {
        questionIndex++;
      }
    }
    selectedAns = -1;

    if (questionIndex == totalQuestion.length) {
      isQuestionPage = false;
    }
  }

  MaterialStateProperty<Color>? colorButton(int index) {
    if (selectedAns != -1) {
      if (index == totalQuestion[questionIndex].ans) {
        return MaterialStatePropertyAll(
            const Color.fromARGB(255, 45, 233, 51).withOpacity(0.5));
      } else if (selectedAns == index) {
        return MaterialStatePropertyAll(
            const Color.fromARGB(255, 255, 72, 59).withOpacity(0.5));
      } else {
        return MaterialStatePropertyAll(Colors.black.withOpacity(0.5));
      }
    } else {
      return MaterialStatePropertyAll(Colors.black.withOpacity(0.5));
    }
  }

  Scaffold displayScreen() {
    if (isStartPage) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "https://i.pinimg.com/736x/21/de/6a/21de6aa253ae7842546c9258b5f9495d.jpg",
                height: 400,
                width: 300,
              ),
              const Text("Press Start Quiz button to start solving quiz"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  isStartPage = false;
                  isQuestionPage = true;
                  setState(() {});
                },
                style: ButtonStyle(
                  fixedSize: const MaterialStatePropertyAll(Size(180, 45)),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.black.withOpacity(0.5),
                  ),
                  overlayColor: const MaterialStatePropertyAll(Colors.black),
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 237, 137, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (isQuestionPage) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 237, 137, 255),
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              "Question ${questionIndex + 1} / ${totalQuestion.length}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question :  ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${totalQuestion[questionIndex].question}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: 400,
              child: ListView.builder(
                itemCount: totalQuestion[questionIndex].options.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(7),
                    child: TextButton(
                      onPressed: () {
                        if (selectedAns == -1) {
                          setState(() {
                            selectedAns = index;
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: colorButton(index),
                        overlayColor: MaterialStateProperty.all(Colors.black),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          totalQuestion[questionIndex].options[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: Colors.black.withOpacity(0.5),
          hoverColor: Colors.black,
          child: const Icon(
            Icons.forward,
            color: Color.fromARGB(255, 237, 137, 255),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QuizApp",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 237, 137, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              "https://static.vecteezy.com/system/resources/thumbnails/006/814/983/small_2x/congratulations-greeting-card-beautiful-greeting-card-scratched-calligraphy-gold-stars-handwritten-modern-brush-lettering-black-background-isolated-vector.jpg",
              height: 200,
              width: 400,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Your score is",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "$correctAns / ${totalQuestion.length}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        questionIndex = 0;
                        selectedAns = -1;
                        correctAns = 0;
                        isQuestionPage = true;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.black.withOpacity(0.5)),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.black),
                    ),
                    child: const Text(
                      "Try Again",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        questionIndex = 0;
                        selectedAns = -1;
                        correctAns = 0;
                        isQuestionPage = false;
                        isStartPage = true;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.black.withOpacity(0.5)),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.black),
                    ),
                    child: const Text(
                      "Reset",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return displayScreen();
  }
}
