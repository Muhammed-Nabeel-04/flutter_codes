import 'package:flashcards_app/question_model.dart';

// final Map<String, List<Map<String, String>>> flashcardData = {
//   "Bussness English": [
//     {
//       "word": 'Communication',
//       'meaning': 'The exchange of information between people.',
//       'example': 'Good communication is importand at work',
//     },
//     {
//       'word': 'Negotiation',
//       'meaning': 'A discussionnto reach an agreement',
//       'example': 'We had a negotiation with the client.',
//     },
//     {
//       "word": 'Communication',
//       'meaning': 'The exchange of information between people.',
//       'example': 'Good communication is importand at work',
//     },
//     {
//       'word': 'Negotiation',
//       'meaning': 'A discussionnto reach an agreement',
//       'example': 'We had a negotiation with the client.',
//     },
//   ],




//   'Tech Terms': [
//     {
//       'word': 'Algorithm',
//       'meaning': 'A step by step procedure for solving a problem',
//       'example': 'we use an algorithm to sort members',
//     },
//     {
//       'word': 'Database',
//       'meaning': 'An organized collection of information',
//       'example': 'The app stores user details in a database',
//     },
//     {
//       'word': 'Algorithm',
//       'meaning': 'A step by step procedure for solving a problem',
//       'example': 'we use an algorithm to sort members',
//     },
//     {
//       'word': 'Database',
//       'meaning': 'An organized collection of information',
//       'example': 'The app stores user details in a database',
//     },
//   ],
// };

// final Map<String, List<Map<String, String>>> flashcardOptions = {
//   "Bussness English": [
//     {
//       'option A': 'A bussness agrement',
//       'option B': 'The exchange of information between poeple',
//       'option C': 'A financial transaction',
//       'option D': 'A technical procces',
//       'answer': 'B',
//     },
//     {
//       'option A': 'A bussness agrement',
//       'option B': 'A discussion into reach an agreement',
//       'option C': 'A financial transaction',
//       'option D': 'A technical procces',
//       'answer': 'B',
//     },
//     {
//       'option A': 'A bussness agrement',
//       'option B': 'The exchange of information between poeple',
//       'option C': 'A financial transaction',
//       'option D': 'A technical procces',
//       'answer': 'B',
//     },
//     {
//       'option A': 'A bussness agrement',
//       'option B': 'A discussion into reach an agreement',
//       'option C': 'A financial transaction',
//       'option D': 'A technical procces',
//       'answer': 'B',
//     },
//   ],
//   'Tech Terms': [
//     {
//       'option A': 'A step by step procedure for solving a problem',
//       'option B': 'An organised collection of information',
//       'option C': 'A programing language',
//       'option D': 'A computer device',
//       'answer': 'A',
//     },
//     {
//       'option A': 'A programing language',
//       'option B': 'A computer device',
//       'option C': 'An organised collection of information',
//       'option D': 'A step by step procedure',
//       'answer': 'C',
//     },
//     {
//       'option A': 'A step by step procedure for solving a problem',
//       'option B': 'An organised collection of information',
//       'option C': 'A programing language',
//       'option D': 'A computer device',
//       'answer': 'A',
//     },
//     {
//       'option A': 'A programing language',
//       'option B': 'A computer device',
//       'option C': 'An organised collection of information',
//       'option D': 'A step by step procedure',
//       'answer': 'C',
//     },
//   ],
// };

List<QuestionModel> questiondataBussnes = [
  QuestionModel(
    question: 'Communication',
    options: {
      'option A': 'A bussness agrement',
      'option B': 'The exchange of information between poeple',
      'option C': 'A financial transaction',
      'option D': 'A technical procces',
    },

    correctanswer: 'The exchange of information between poeple',
    example: 'Good communication is importand at work',
  ),

  QuestionModel(
    question: 'Negotiation',
    options: {
      'option A': 'A bussness agrement',
      'option B': 'A discussion into reach an agreement',
      'option C': 'A financial transaction',
      'option D': 'A technical procces',
    },

    correctanswer: 'A discussion into reach an agreement',
    example: 'We had a negotiation with the client',
  ),
  QuestionModel(
    question: 'Communication',
    options: {
      'option A': 'A bussness agrement',
      'option B': 'The exchange of information between poeple',
      'option C': 'A financial transaction',
      'option D': 'A technical procces',
    },

    correctanswer: 'The exchange of information between poeple',
    example: 'Good communication is importand at work',
  ),

  QuestionModel(
    question: 'Negotiation',
    options: {
      'option A': 'A bussness agrement',
      'option B': 'A discussion into reach an agreement',
      'option C': 'A financial transaction',
      'option D': 'A technical procces',
    },

    correctanswer: 'A discussion into reach an agreement',
    example: 'We had a negotiation with the client',
  ),
];

List<QuestionModel> questiondataTech = [
  QuestionModel(
    question: 'Algorithm',
    options: {
      'option A': 'A step by step procedure for solving a problem',
      'option B': 'An organised collection of information',
      'option C': 'A programing language',
      'option D': 'A computer device',
    },

    correctanswer: 'A step by step procedure for solving a problem',
    example: 'Good communication is importand at work',
  ),

  QuestionModel(
    question: 'Database',
    options: {
      'option A': 'A programing language',
      'option B': 'A computer device',
      'option C': 'An organised collection of information',
      'option D': 'A step by step procedure',
    },

    correctanswer: 'An organised collection of information',
    example: 'The app stores user details in a database',
  ),
  QuestionModel(
    question: 'Algorithm',
    options: {
      'option A': 'A step by step procedure for solving a problem',
      'option B': 'An organised collection of information',
      'option C': 'A programing language',
      'option D': 'A computer device',
    },

    correctanswer: 'A step by step procedure for solving a problem',
    example: 'Good communication is importand at work',
  ),

  QuestionModel(
    question: 'Database',
    options: {
      'option A': 'A programing language',
      'option B': 'A computer device',
      'option C': 'An organised collection of information',
      'option D': 'A step by step procedure',
    },

    correctanswer: 'An organised collection of information',
    example: 'The app stores user details in a database',
  ),
];


