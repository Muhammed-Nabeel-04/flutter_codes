import 'package:flutter/material.dart';

import 'dart:math';

import 'package:lucky_draw/gradient_container.dart';
import 'package:lucky_draw/player_input.dart';
import 'package:lucky_draw/result_banner.dart';
import 'package:lucky_draw/wheel.dart';

class LuckeySpin extends StatefulWidget {
  const new({super.key});

  @override
  State<LuckeySpin> createState() => _LuckeySpinState();
}


class _LuckeySpinState extends State<LuckeySpin> {
  List<String> prizes = ["Mouse", 'keyboard', 'Laptop'];
  List<String> players = [];
  String result = "Let's spin";
  double rotation = 0;
  String winningMessage = '';

  TextEditingController playerController = TextEditingController();
  int currentPlayerIndex = 0;


  String selectPrice(List<String> items) {
    // final random = Random();
    int index = Random().nextInt(items.length);
    String selectedPrice = items[index];
    // items.remove(items[index]);
    items.removeAt(index);
    return selectedPrice;
  }


  void hadleSpin() {
    if (prizes.isEmpty || prizes.isEmpty) return;
    setState(() {
      result = selectPrice(prizes);
      String currentPlayer = players[currentPlayerIndex];
      winningMessage = announce(name: currentPlayer, prize: result);
      currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
      rotation += Random().nextDouble() * (2 * pi);
    });
  }


  String announce({required String name, required String prize}) {
    return ('$name won $prize');
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(angle: rotation, child: WheelSpin()), // image...
              // Text(rotation.toString()),

              SizedBox(height: 20),

              ResultBanner(prize: result),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: prizes.isEmpty || players.isEmpty ? null : hadleSpin,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text('Spin', style: TextStyle(color: Colors.white)),
              ),

              if (prizes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(30),

                  child: PlayerInput(
                    controller: playerController,
                    onAdd: () {
                      if (playerController.text.trim().isNotEmpty &&
                          !players.contains(playerController.text.trim())) {
                        setState(() {
                          players.add(playerController.text.trim());
                          playerController.clear();
                        });
                      }
                    },
                  ),
                ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 16,
                children: players.map((player) {
                  return Chip(label: Text(player));
                }).toList(),
              ),
              if (players.isNotEmpty)
                Text(
                  "${players[currentPlayerIndex]}'s Turn",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

              // ResultBanner(prize: result),
              if (winningMessage.isNotEmpty)
                Text(
                  winningMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
