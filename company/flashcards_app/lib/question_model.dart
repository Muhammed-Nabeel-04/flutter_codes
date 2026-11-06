class QuestionModel {
  final String question;
  final Map<String, String> options;
  final String correctanswer;
  final String example;

  QuestionModel({
    this.question = '',
    required this.options,
    this.correctanswer = '',
    this.example = '',
  });
}
