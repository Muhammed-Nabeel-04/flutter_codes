import 'package:flashcards_app/flashcard_data.dart';
import 'package:flashcards_app/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Flashcards extends StatefulWidget {
  const new({super.key});

  @override
  State<Flashcards> createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  String selectedType = 'Bussness English';
  int totalQuestions = 0;

  // List<Map<String, String>> get flashcards {
  //   return flashcardData[selectedType] ?? [];
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vocabolary Learning',
          style: GoogleFonts.openSans(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your deck',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 200),

            Column(
              children: [
                ChoiceChip(
                  label: Text("Bussness English"),
                  selected: selectedType == 'Bussness English',
                  onSelected: (value) {
                    setState(() {
                      selectedType = 'Bussness English';
                      // flashcards = flashcardData[selectedType]!;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Tech Terms'),
                  selected: selectedType == 'Tech Terms',
                  onSelected: (value) {
                    setState(() {
                      selectedType = 'Tech Terms';
                      // flashcards = flashcardData[selectedType]!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(questiondataBussnes[0].question),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => QuizScreen(
                      //   typeName: selectedType,
                      //   flashcards: flashcardData[selectedType] ?? [],
                      //   options: flashcardOptions[selectedType] ?? [],
                      //   totalQuestions: flashcardData[selectedType]!.length,
                      // ),


                      

                      builder: (context) => QuizScreen(
                        typeName: selectedType,
                        // flashcards: flashcardData[selectedType] ?? [],
                        // options: flashcardOptions[selectedType] ?? [],
                        // totalQuestions: flashcardData[selectedType]!.length,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
