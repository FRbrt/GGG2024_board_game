import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/archer.dart';
import 'package:ggg_board_game/models/game_board.dart';
import 'board_tile.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int rows = 13;
  int columns = 7;
  int nrOfObstacles = 5 * 6;
  
  late var boardModel;

  void _updateGridElement(int row, int col) {
    setState(() {
      // Example update: Change the tapped element
      boardModel.moveTo(row, col);
    });
  }

@override
  Widget build(BuildContext context) {
    boardModel = GameBoard(rows, columns, nrOfObstacles);
    
  return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns, // Set the number of columns
          crossAxisSpacing: 1.0, // Set the spacing between columns
          mainAxisSpacing: 1.0, // Set the spacing between rows
        ),
        itemCount: rows * columns,
        itemBuilder: (context, index) {
          int row = index ~/ columns; // Integer division to get row index
          int col = index % columns; // Modulo to get column index
          return BoardTile(isHighlighted: false, placement: boardModel.board[row][col], onTapped: (column, row) {
            _updateGridElement(row, col);
          });
        },
      );
  }
}


