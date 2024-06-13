import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/acrobat.dart';
import 'package:ggg_board_game/models/archer.dart';
import 'package:ggg_board_game/models/architect.dart';
import 'package:ggg_board_game/models/placement.dart';
import 'package:ggg_board_game/models/obstacle.dart';

class BoardTile extends StatefulWidget {
  final Placement placement;
  final bool isHighlighted;
  final Function(int, int) onTapped;
  
  const BoardTile({super.key, required this.placement, required this.isHighlighted, required this.onTapped});

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  late Placement _placement;

  @override
  void initState() {
    super.initState();
    _placement = widget.placement;
  }

  @override
  Widget build(BuildContext context) {

  return Container(
      width: 100.0, // width of the square tile
      height: 100.0,
      decoration: BoxDecoration(
      color: backgroundColor(), // Background color// Rounded corners
      boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
      ),
      ],
      ),
      child: TextButton(onPressed: () {
        print('${widget.placement.column} , ${widget.placement.row}');
        widget.onTapped(widget.placement.column, widget.placement.row);
        //currentPlayer.action(column, row, position)
        //player.takeResource
      },
      child: icon()
      ),
    );
  }

  Widget icon() {
    if (_placement is Obstacle) {
      return const Image(image: AssetImage('assets/obstacole/copac.png'));
    }

    if (_placement is Archer) {
      return const Image(image: AssetImage('assets/jucatori/jarcas1.png'));
    }

    if (_placement is Architect) {
      return const Image(image: AssetImage('assets/jucatori/jarhitect1.png'));
    }

    if (_placement is Acrobat) {
      return const Image(image: AssetImage('assets/jucatori/jacrobat1.png'));
    }
    
    return Container();
  }

  Color backgroundColor() {
    return widget.isHighlighted ? Colors.yellow : Colors.green;
  }
}
