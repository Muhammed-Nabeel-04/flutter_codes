import 'package:flashcards_app/question_model.dart';
import 'package:flashcards_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flashcards_app/flashcard_data.dart';

class QuizScreen extends StatefulWidget {
  final String typeName;
  final List<QuestionModel> flashcards;
  // final int totalQuestions;

  const new({
    super.key,
    required this.typeName,
    required this.flashcards,
    // required this.totalQuestions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentindex = 0;
  bool showExapmle = false;
  bool flipCard = false;
  late List<String> shuffled;
  String? selectedOption;
  List<AnswerModel> userAnswers = [];

  @override
  void initState() {
    super.initState();
    shufledoptions();
  }



  void shufledoptions() {
    final optionData = widget.flashcards[currentindex].options;
    shuffled = optionData.values.toList();
    shuffled.shuffle();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.typeName,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    flipCard = !flipCard;
                    showExapmle = false;
                  });
                },

                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      if (!flipCard) ...[
                        Row(
                          children: [
                            Text(
                              widget.flashcards[currentindex].question,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  flipCard = !flipCard;
                                  showExapmle = false;
                                });
                              },
                              icon: Icon(Icons.flip_camera_android),
                            ),
                          ],
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Text(
                              'Example:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  flipCard = !flipCard;
                                });
                              },
                              icon: Icon(Icons.flip_camera_android),
                            ),
                          ],
                        ),

                        Text(
                          widget.flashcards[currentindex].example,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // SizedBox(height: 20),

              // Text(
              //   widget.flashcards[currentindex]['meaning'] ?? '',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 18),
              // ),
              SizedBox(height: 20),

              ...shuffled.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                // final test = entry.value.key;

                // output:-
                // [
                //   MapEnty(0, MapEntry('C', 'jddjsxiix')),
                //   MapEnty(1, MapEntry('D', 'dxwedwdwx')),
                //   MapEnty(2, MapEntry('B', 'xewwwfceew')),
                //   MapEnty(3, MapEntry('A', 'owojdncmdle')),
                // ]

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedOption == option
                            ? Colors.blue
                            : Colors.blueGrey,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(String.fromCharCode(65 + index)),
                        ),
                        title: Text(option),
                        onTap: selectedOption == null
                            ? () {
                                setState(() {
                                  selectedOption = option;





                                  userAnswers.add(
                                    AnswerModel(
                                      question: widget
                                          .flashcards[currentindex]
                                          .question,
                                      selectedanswer: option,
                                      correctanswer: widget
                                          .flashcards[currentindex]
                                          .correctanswer,
                                    ),
                                  );




                                });
                              }
                            : null,
                      ),
                    ),
                  ],
                );
              }),

              TextButton(
                onPressed: () {
                  setState(() {
                    if (!showExapmle) {
                      showExapmle = true;
                    } else {
                      showExapmle = false;
                    }
                  });
                },
                child: Text('Example:'),
              ),

              if (showExapmle) ...[
                Text(widget.flashcards[currentindex].example),
                SizedBox(height: 20),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       if (currentindex > 0) {
                  //         currentindex--;
                  //         shufledoptions();
                  //         // selectedOption = null;
                  //       }
                  //     });
                  //   },
                  //   child: Text('Previous'),
                  // ),

                  if (currentindex < widget.flashcards.length - 1)
                    ElevatedButton(
                      onPressed: selectedOption != null
                          ? () {
                              setState(
                                () {
                                  currentindex++;
                                  shufledoptions();
                                  selectedOption = null;
                                  showExapmle = false;
                                  flipCard = false;
                                },
                                // }
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: selectedOption == null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),

                  if (currentindex == widget.flashcards.length - 1)
                    ElevatedButton(
                      onPressed: selectedOption != null
                          ? () {
                              // answer(userAnswers);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    typeName: widget.typeName,
                                    userAnswers: userAnswers,
                                    flashcards: widget.flashcards,
                                    // totalQuestions: widget.totalQuestions,
                                  ),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),

                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: selectedOption == null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 20),

              Text(
                'Question ${currentindex + 1} of ${widget.flashcards.length}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
