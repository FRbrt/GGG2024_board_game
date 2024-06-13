import 'dart:math';

import 'package:ggg_board_game/models/obstacle.dart';
import 'package:ggg_board_game/models/placement.dart';
import 'package:ggg_board_game/models/road.dart';

class GameBoard {
  final rowKey = "row";
  final colKey = "col";

  List<List<Placement>> board = [[]];

  void init(int rows, int cols, int nrOfObstacles) {
    var obstacleIndexes = genObstacleIndexes(rows, cols, nrOfObstacles);

    for (var col = 0; col < cols; col++) {
      for (var row = 0; row < rows; row++) {
        var isObstacle = obstacleIndexes.any( (p) => p[rowKey] == row && p[colKey] == col );
        if (isObstacle) {
          board[row][col] = Obstacle();
        }
        else {
          board[row][col] = Road();
        }
      }
    }
  }

  List<Map<String, int>> genObstacleIndexes(int rows, int cols, int pairCount) {
    List<Map<String, int>> generatedPairs = [{}];
    var random = Random();

    var pairNumber = 0;
    while (pairNumber < pairCount) {
      var row = random.nextInt(rows);
      var col = random.nextInt(cols);
      var pair = {
        rowKey : row,
        colKey: col
      };

      if (isPairValid(generatedPairs, pair)) {
        generatedPairs.add(pair);
        ++pairNumber;
      }
    }

    return generatedPairs;
  }

  bool isPairValid(List<Map<String, int>> pairs, Map<String, int> pairToCheck) {
    var isValid = true;

    pairs.forEach((pair) {
      var areRowsTheSame = pairToCheck[rowKey] == pair[rowKey];
      var areColsTheSame = pairToCheck[colKey] == pair[colKey];
      if (areRowsTheSame && areColsTheSame) {
        isValid = false;
      }
    });

    return isValid;
  }
}
