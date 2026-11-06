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



class AnswerModel{
  final String question;
  final String selectedanswer;
  final String correctanswer;
  bool get isCorrect => selectedanswer == correctanswer;


  AnswerModel({
    required this.question,
    required this.selectedanswer,
    required this.correctanswer
  });
}


// class QuestionModel {
//   final String question;
//   final Map<String, String> options;
//   final String correctanswer;
//   final String example;

//   QuestionModel({
//     this.question = '',
//     required this.options,
//     this.correctanswer = '',
//     this.example = '',
//   });
// }


