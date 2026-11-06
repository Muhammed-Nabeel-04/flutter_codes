import 'package:flashcards_app/flashcard_data.dart';
import 'package:flashcards_app/question_model.dart';
import 'package:flashcards_app/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int correctAnswers = 0;


class ResultScreen extends StatefulWidget {
  final String typeName;
  final List<AnswerModel> userAnswers;

  final List<QuestionModel> flashcards;
  // final int totalQuestions;

  const new({
    super.key,
    required this.typeName,
    required this.userAnswers,
    required this.flashcards,
    // required this.totalQuestions,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final int lengthof = widget.typeName == 'Bussness English'
        ? questiondataBussnes.length
        : questiondataTech.length;

     correctAnswers += widget.userAnswers
        .where((answer) => answer.isCorrect)
        .length;

        

    final int wrongAnswer = lengthof - correctAnswers;

    final double percentage = (correctAnswers / lengthof) * 100;

    final wrongIndexes = widget.userAnswers
        .asMap()
        .entries
        .where(
          (entry) => entry.value.selectedanswer != entry.value.correctanswer,
        )
        .map((entry) => entry.key)
        .toList();
    // example :-
    // wrongIndexes = [0,3];

    final wrongFlashcards = wrongIndexes
        .map((index) => widget.flashcards[index])
        .toList();
    // save the questions to wrongFlashcards.

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.typeName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),

            SizedBox(height: 25),

            Text(
              '${percentage.toString()} %',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),

              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Questions'),
                      Text('Correct Answers'),
                      Text('Wrong Answers'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lengthof.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),

                        Text(correctAnswers.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),

                        Text(wrongAnswer.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            if (wrongAnswer > 0) ...[
              Text(
                'Words to improve',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Expanded(
                child: ListView(
                  children: [
                    ...widget.userAnswers
                        .where(
                          (answer) =>
                              answer.selectedanswer != answer.correctanswer,
                        )
                        .map(
                          (answer) => Card(
                            child: ListTile(
                              title: Text(
                                answer.question,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      Text('Your answer: '),
                                      Text(
                                        answer.selectedanswer,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Wrap(
                                    children: [
                                      Text('Correct Answer: '),
                                      Text(
                                        answer.correctanswer,
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // trailing: Text('right answer is ${answer['correctanswer']}'),
                            ),
                          ),
                        ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pushReplacement(
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        typeName: widget.typeName,
                        flashcards: wrongFlashcards,
                        // totalQuestions: widget.flashcards.length,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.refresh),
                label: Text('Try Again'),
              ),
            ],
            SafeArea(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}

// int numofquestions = 0;
