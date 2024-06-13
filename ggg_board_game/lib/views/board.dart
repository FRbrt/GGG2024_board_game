import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/archer.dart';
import 'package:ggg_board_game/models/game_board.dart';
import 'package:ggg_board_game/models/obstacle.dart';
import 'board_tile.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int rows = 20;
  int columns = 6;
  int nrOfObstacles = 3;
  
  late var boardModel;

@override
  Widget build(BuildContext context) {
    boardModel = GameBoard(rows, columns, nrOfObstacles);
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns, // Number of columns
        childAspectRatio: 1.0, // Square tiles (you can adjust as needed)
      ),
      itemCount: rows * columns,
      itemBuilder: (context, index) {
        int row = index ~/ columns; // Integer division to get row index
        int col = index % columns; // Modulo to get column index
        // String element = gridElements[row][col];

        BoardTile(placement: boardModel.board[row][col], isHighlighted: false);
      },
    );
  }
}
