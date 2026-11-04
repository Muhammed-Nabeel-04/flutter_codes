import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String typeName;
  final List<Map<String, String>> flashcards;
  final List<Map<String, String>> options;

  const new({
    super.key,
    required this.typeName,
    required this.flashcards,
    required this.options,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentindex = 0;
  bool showExapmle = false;
  late List<MapEntry<String, String>> shuffled;
  String? selectedOption;
  List<Map<String, String>> userAnswers = [];

  @override
  void initState() {
    super.initState();
    shufledoptions();
  }

  void shufledoptions() {
    final optionData = widget.options[currentindex];
    shuffled = ['A', 'B', 'C', 'D']
        .map((letter) => MapEntry(letter, optionData['option $letter'] ?? ''))
        .toList();
    shuffled.shuffle();
  }

  void checkAns() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.typeName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.flashcards[currentindex]['word'] ?? '',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Text(
                widget.flashcards[currentindex]['meaning'] ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              ...shuffled.map((option) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text(option.key)),
                      title: Text(option.value),
                      onTap: selectedOption == null
                          ? () {
                              setState(() {
                                selectedOption = option.key;
                                userAnswers.add({
                                  'word':
                                      widget.flashcards[currentindex]['word'] ??
                                      '',
                                  'selected': option.key,
                                  'correct':
                                      widget.options[currentindex]['currectOption'] ??
                                      '',
                                });
                              });
                            }
                          : null,

                      tileColor: selectedOption == option.key
                          ? Colors.blue
                          : Colors.blueGrey,
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
                Text(widget.flashcards[currentindex]['example'] ?? ''),
                SizedBox(height: 20),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentindex > 0) {
                          currentindex--;
                          shufledoptions();
                          selectedOption = null;
                        }
                      });
                    },
                    child: Text('Previous'),
                  ),

                  ElevatedButton(
                    onPressed: selectedOption != null ?  () {
                      setState(() {
                        if (currentindex < widget.flashcards.length -1) {
                          currentindex++;
                          shufledoptions();
                          selectedOption = null;
                        }
                      });
                    } : null,
                    child: Text('Next'),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Text(
                'Card $currentindex of ${widget.flashcards.length - 1}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
