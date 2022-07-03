class PairQuestionAndAnswer {
  String question;
  String fact;
  bool? keyAnswer;
  int skipScore;
  int rightScore;
  int wrongScore;

  PairQuestionAndAnswer(
      {required this.question,
      required this.fact,
      this.wrongScore = -1,
      this.rightScore = 5,
      this.skipScore = 0,
      this.keyAnswer});

  PairQuestionAndAnswer.withScore(
      {required this.question,
      required this.fact,
      required this.skipScore,
      required this.rightScore,
      required this.wrongScore,
      this.keyAnswer});
}
