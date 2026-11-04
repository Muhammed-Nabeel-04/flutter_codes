import 'package:flutter/material.dart';
import 'package:lucky_draw/final_widget.dart';

import 'dart:math';

import 'package:lucky_draw/gradient_container.dart';
import 'package:lucky_draw/player_input.dart';
import 'package:lucky_draw/wheel.dart';

class LuckeySpin extends StatefulWidget {
  const new({super.key});

  @override
  State<LuckeySpin> createState() => _LuckeySpinState();
}

class _LuckeySpinState extends State<LuckeySpin> {
  List<String> prizes = [
    "Mouse",
    'keyboard',
    'Laptop',
    "Mouse",
    'keyboard',
    'Laptop',
    "Mouse",
    'keyboard',
    'Laptop',
    "Mouse",
    'keyboard',
    'Laptop',
  ];
  List<String> players = [];
  String result = "Let's spin";
  double rotation = 0;
  String winningMessage = '';

  TextEditingController playerController = TextEditingController();
  int currentPlayerIndex = 0;
  int numberOfPlayer = 0;
  TextEditingController numberController = TextEditingController();
  bool startGame = false;
  bool startButton = true;
  int count = 0;
  List<Map<String, String>> winners = [];
  int indexoflist = 0;
  bool listView = false;

  String selectPrice(List<String> items) {
    // final random = Random();
    int index = Random().nextInt(items.length);
    String selectedPrice = items[index];
    // items.remove(items[index]);
    items.removeAt(index);
    return selectedPrice;
  }

  String announce({required String name, required String prize}) {
    return ('$name won $prize');
  }

  void hadleSpin() {
    // if (prizes.isEmpty || prizes.isEmpty) return;
    setState(() {
      result = selectPrice(prizes); // result
      String currentPlayer = players[currentPlayerIndex];
      winningMessage = announce(name: currentPlayer, prize: result); //announce
      currentPlayerIndex = (currentPlayerIndex + 1) % players.length; // .....
      rotation += Random().nextDouble() * (2 * pi); // rotation
    });
  }

  void clickCount() {
    count++;
  }

  void addToDict() {
    // winners[players[currentPlayerIndex]] = result;
    if (result == 'Laptop') {
      winners.add({'player': players[currentPlayerIndex], 'prize': "ytdrttr"});
    } else {
      winners.add({'player': players[currentPlayerIndex], 'prize': result});
    }
  }

  void countindex() {
    indexoflist++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lucky Spin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: GradientContainer(
        color1: Colors.brown,
        color2: Colors.green,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prizes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(30),

                    child: PlayerInput(
                      controller2: numberController,
                      numPlayer: () {
                        setState(() {
                          numberOfPlayer =
                              int.tryParse(numberController.text) ?? 0;
                          numberController.clear();
                        });
                      },

                      controller1: playerController,
                      onAdd: () {
                        if (playerController.text.trim().isNotEmpty &&
                            !players.contains(playerController.text.trim()) &&
                            numberOfPlayer > 0 &&
                            players.length <= numberOfPlayer) {
                          setState(() {
                            players.add(playerController.text.trim());
                            playerController.clear();
                          });
                        }
                      },
                      playerLength: players.length,
                      numberOfPlayer: numberOfPlayer,
                    ),
                  ),

                if (numberOfPlayer > 0 && players.length < numberOfPlayer)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 600,

                      child: ListView.builder(
                        itemCount: players.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child: Text(players[index])),
                          );
                        },
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                if (players.length == numberOfPlayer &&
                    players.length > 0 &&
                    startButton)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        startGame = true;
                        startButton = false;
                      });
                    },
                    child: Text('Start'),
                  ),

                SizedBox(height: 20),

                if (startGame) ...[
                  Transform.rotate(
                    angle: rotation,
                    child: WheelSpin(),
                  ), // image...
                  // ResultBanner(prize: result),
                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: prizes.isEmpty || players.isEmpty
                        ? null
                        : () {
                            hadleSpin();
                            clickCount();
                            addToDict();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text('Spin', style: TextStyle(color: Colors.white)),
                  ),

                  SizedBox(height: 20),

                  FinalWidget(
                    currentPlayerIndex: currentPlayerIndex,
                    winningMessage: winningMessage,
                    players: players,
                  ),

                  if (!listView)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listView = true;
                        });
                      },
                      child: Text(
                        'List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                  SizedBox(height: 20),
                  if (listView)
                    Column(
                      children: winners.asMap().entries.map((entry) {
                        countindex();
                        return Container(
                          color: Colors.white70,
                          child: ListTile(
                            tileColor: Colors.black,
                            shape: RoundedRectangleBorder(),
                            title: Text(
                              "${entry.key + 1}) ${entry.value['player']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            trailing: Text(
                              entry.value['prize']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                  // Column(
                  //   children: [
                  //     for(var entry in winners.entries)
                  //     Row(
                  //       children: [

                  //         Padding(padding: EdgeInsetsGeometry.all(20)),
                  //         Text("${entry.key} won", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  //         SizedBox(width: 40),
                  //         Text(entry.value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
