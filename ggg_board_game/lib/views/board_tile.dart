import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/placement.dart';
import 'package:ggg_board_game/models/obstacle.dart';

class BoardTile extends StatefulWidget {
  final Placement placement;
  const BoardTile({super.key, required this.placement});

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  late Placement _placement;

  @override
  void initState() {
    super.initState();
    _placement = widget.placement; // Initialize the counter with the passed parameter
  }

  @override
  Widget build(BuildContext context) {

  return Container(
      width: 100.0, // width of the square tile
      height: 100.0, 
      decoration: BoxDecoration(
        color: const Color(0xBDE0AF) // border color and width
      ),
      child: TextButton(onPressed: () {
        
      }, 
      child: (_placement is Obstacle) ? const Image(image: AssetImage('assets/obstacole/copac.png')) : Container()
      ),
    );
  }
}
