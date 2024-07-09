class SingleQuestionModel {
  final String? question;
  final List? options;
  final int? ans;

  const SingleQuestionModel(
      {required this.question, required this.options, required this.ans});
}

List totalQuestion = [
  const SingleQuestionModel(
    question: "What is Linux? ",
    options: [
      "Programming Laguage",
      "Framework",
      "Cloud Platform",
      "Operating System",
    ],
    ans: 3,
  ),
  const SingleQuestionModel(
    question: "should you learn Flutter?",
    options: [
      "Yes",
      "No",
    ],
    ans: 0,
  ),
  const SingleQuestionModel(
    question: "What is Java? ",
    options: [
      "Programming Laguage",
      "Framework",
      "Cloud Platform",
      "Operating System",
    ],
    ans: 0,
  ),
  const SingleQuestionModel(
    question: "What is AWS? ",
    options: [
      "Programming Laguage",
      "Framework",
      "Cloud Platform",
      "Operating System",
    ],
    ans: 2,
  ),
  const SingleQuestionModel(
    question: "What is Rust? ",
    options: [
      "Programming Laguage",
      "Framework",
      "Cloud Platform",
      "Operating System",
    ],
    ans: 0,
  ),
];
