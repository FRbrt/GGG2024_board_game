import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/game_board.dart';
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
  
  var boardModel = GameBoard(3, 4, 2);

@override
  Widget build(BuildContext context) {
    // boardModel.init(rows, columns, nrOfObstacles);
  int totalTiles = rows * columns;
   return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
      ),
      itemCount: totalTiles,
      itemBuilder: (context, index) {
        return BoardTile(placement: boardModel.board[index][index]);
      },
    );
  }
}
