import 'package:ggg_board_game/models/acrobat.dart';
import 'package:ggg_board_game/models/archer.dart';
import 'package:ggg_board_game/models/architect.dart';
import 'package:ggg_board_game/models/placement.dart';

class Players {

  var players = {
    Archer() : {
      "row" : 0,
      "col" : 0,
    },
    Acrobat() : {
      "row" : 0,
      "col" : 0,
    },
    Architect() : {
      "row" : 0,
      "col" : 0,
    },
    Archer() : {
      "row" : 0,
      "col" : 0,
    },
    Acrobat() : {
      "row" : 0,
      "col" : 0,
    },
    Architect() : {
      "row" : 0,
      "col" : 0,
    },
  };
  var _currentIndex = 0;

  Map<String, int> currentPosition() {
    var player = players.entries.elementAt(_currentIndex);
    return player.value;
  }

  Placement current() {
    var entry = players.entries.elementAt(_currentIndex);

    var currentPlayer = entry.key;
    return currentPlayer;
  }

  Placement next() {
    _currentIndex++;
    if (_currentIndex == players.length) {
      _currentIndex = 0;
    }

    return current();
  }

  void moveCurrent(int toRow, int toCol) {
    var player = players.entries.elementAt(_currentIndex);
    player.value["row"] = toRow;
    player.value["col"] = toCol;
  }
}
