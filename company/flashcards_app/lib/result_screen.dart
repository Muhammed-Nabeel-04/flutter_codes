import 'package:flashcards_app/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultScreen extends StatefulWidget {
  final String typeName;
  final List<Map<String, String>> userAnswers;
  final List<Map<String, String>> flashcards;
  final List<Map<String, String>> options;
  final int totalQuestions;

  const new({
    super.key,
    required this.typeName,
    required this.userAnswers,
    required this.options,
    required this.flashcards,
    required this.totalQuestions,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final int correctAnswers = widget.userAnswers
        .where((answer) => answer['selected'] == answer['correctanswer'])
        .length;

    final int wrongAnswer = widget.totalQuestions - correctAnswers;
    final double percentage = (correctAnswers / widget.totalQuestions) * 100;

    final wrongIndexes = widget.userAnswers
        .asMap()
        .entries
        .where(
          (entry) => entry.value['selected'] != entry.value['correctanswer'],
        )
        .map((entry) => entry.key)
        .toList();

    final wrongFlashcards = wrongIndexes
        .map((index) => widget.flashcards[index])
        .toList();
        
    final wrongOptions = wrongIndexes
        .map((index) => widget.options[index])
        .toList();

    // final wrongAnswers = widget.userAnswers
    //     .where((answer) => answer['selected'] != answer['correctanswer'])
    //     .toList();

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(widget.totalQuestions.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),

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
                              answer['selected'] != answer['correctanswer'],
                        )
                        .map(
                          (answer) => Card(
                            child: ListTile(
                              title: Text(
                                answer['word'] ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      Text('Your answer: '),
                                      Text(
                                        '${answer['selected']}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Wrap(
                                    children: [
                                      Text('Correct Answer: '),
                                      Text(
                                        '${answer['correctanswer']}',
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
                        // flashcards: wrongFlashcards,
                        // options: wrongOptions,
                        // totalQuestions: wrongFlashcards.length,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.refresh),
                label: Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
