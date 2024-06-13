// ignore_for_file: file_names

import 'package:ggg_board_game/models/player.dart';
import 'package:ggg_board_game/models/placement.dart';

class Archer implements Player {
  @override
  late int column;
  
  @override
  late int row;
  
  List<Placement>? canMove(List<Placement> path) {
    return null;
  }
}
