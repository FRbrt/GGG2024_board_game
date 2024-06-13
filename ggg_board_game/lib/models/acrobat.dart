import 'package:ggg_board_game/models/player.dart';
import 'package:ggg_board_game/models/placement.dart';

class Acrobat implements Player {
  @override
  late int column;

  @override
  late int row;
  List<Placement>? canMove(List<Placement> path) {
    return null;
  }
}
