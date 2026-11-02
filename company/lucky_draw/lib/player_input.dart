import 'package:flutter/material.dart';

class PlayerInput extends StatelessWidget {
  final TextEditingController controller2;
  final VoidCallback numPlayer;
  final VoidCallback onAdd;
  final TextEditingController controller1;
  final int numberOfPlayer;
  final int playerLength;

  const new({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.onAdd,
    required this.numPlayer,
    required this.numberOfPlayer,
    required this.playerLength
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (numberOfPlayer == 0)
          TextField(
            controller: controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Number of players",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.white70,
              filled: true,
              suffix: IconButton(onPressed: numPlayer, icon: Icon(Icons.add)),
            ),
          ),
        SizedBox(height: 16),

        if (numberOfPlayer > 0 && playerLength < numberOfPlayer) ...[
          TextField(
            controller: controller1,

            decoration: InputDecoration(
              hintText: 'Enter player name',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),

          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
            child: Text('Add Player', style: TextStyle(color: Colors.black)),
          ),
        ],
      ],
    );
  }
}
