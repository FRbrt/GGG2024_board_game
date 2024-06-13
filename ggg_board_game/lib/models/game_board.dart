import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/board_config.dart';
import 'package:ggg_board_game/models/obstacle.dart';
import 'package:ggg_board_game/models/placement.dart';
import 'package:ggg_board_game/models/players.dart';
import 'package:ggg_board_game/models/road.dart';

class GameBoard {
  final rowKey = "row";
  final colKey = "col";

  List<List<Placement>> board = [[]];
  List<int> teamInitialColumns = List<int>.empty(growable: true);

  final Players _players = Players();

  late BoardConfig boardConfig;

  GameBoard.cfg(this.boardConfig) {
    var rows = boardConfig.rows;
    var cols = boardConfig.cols;
    var nrOfObstacles = boardConfig.nrOfObstacles;

    teamInitialColumns.add(0);
    teamInitialColumns.add((cols - 1) ~/ 2);
    teamInitialColumns.add(cols - 1);

    board = List<List<Placement>>.empty(growable: true);

    var obstacleIndexes = genObstacleIndexes(rows, cols, nrOfObstacles);
    for (var row = 0; row < rows; row++) {
      board.add(List<Placement>.empty(growable: true));
      for (var col = 0; col < cols; col++) {
        var isObstacle =
            obstacleIndexes.any((p) => p[rowKey] == row && p[colKey] == col);
        if (isObstacle) {
          board[row].add(Obstacle());
        }
        else {
          board[row].add(Road());
        }
      }
    }
  }

  GameBoard(int rows, int cols, int nrOfObstacles) {
    boardConfig = BoardConfig(rows, cols, nrOfObstacles);
    teamInitialColumns.add(0);
    teamInitialColumns.add((cols - 1) ~/ 2);
    teamInitialColumns.add(cols - 1);

    board = List<List<Placement>>.empty(growable: true);

    var obstacleIndexes = genObstacleIndexes(rows, cols, nrOfObstacles);
    for (var row = 0; row < rows; row++) {
      board.add(List<Placement>.empty(growable: true));
      for (var col = 0; col < cols; col++) {
        var isObstacle = obstacleIndexes.any((p) => p[rowKey] == row && p[colKey] == col);
        var isPlayerPosition = (row == 0 || row == rows - 1) && (teamInitialColumns.any( (tCol) => col == tCol ));

        if (isObstacle) {
          board[row].add(Obstacle());
        }
        else if (isPlayerPosition) {
          board[row].add(_players.next());
        }
        else {
          board[row].add(Road());
        }
      }
    }
  }

  List<Map<String, int>> genObstacleIndexes(int rows, int cols, int pairCount) {
    List<Map<String, int>> generatedPairs = List.empty(growable: true);
    var random = Random();

    var pairNumber = 0;
    while (pairNumber < pairCount) {
      var row = random.nextInt(rows);
      var col = random.nextInt(cols);
      var pair = {rowKey: row, colKey: col};

      if (isPairValid(generatedPairs, pair)) {
        generatedPairs.add(pair);
        ++pairNumber;
      }
    }

    return generatedPairs;
  }

  bool isPairValid(List<Map<String, int>> pairs, Map<String, int> pairToCheck) {
    var isValid = true;

    var isPlayerInitialRow = pairToCheck[rowKey] == 0 || pairToCheck[rowKey] == boardConfig.rows - 1;
    var isPlayerColumn = teamInitialColumns.any( (col) => pairToCheck[colKey] == col );
    var isPlayerPosition = isPlayerInitialRow && isPlayerColumn;

    pairs.forEach((pair) {
      var areRowsTheSame = pairToCheck[rowKey] == pair[rowKey];
      var areColsTheSame = pairToCheck[colKey] == pair[colKey];

      if ((areRowsTheSame && areColsTheSame) || isPlayerPosition) {
        isValid = false;
      }
    });

    return isValid;
  }

  void moveTo(int toRow, int toCol) {
    var player = _players.current();
    var currentPosition = _players.currentPosition();
    board[currentPosition["row"] as int][currentPosition["col"] as int] = Road();
    board[toRow][toCol] = player;
    _players.moveCurrent(toRow, toCol);

    _players.next();
  }
}
