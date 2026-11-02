import 'package:flutter/material.dart';

class FinalWidget extends StatelessWidget {
  final int currentPlayerIndex ;
  final  String winningMessage;
  final List<String> players;

  const new({super.key,
  required this.currentPlayerIndex,
  required this.winningMessage,
  required this.players
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
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
                ),]);
  }
}