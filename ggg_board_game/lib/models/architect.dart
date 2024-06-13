import 'package:ggg_board_game/models/player.dart';
import 'package:ggg_board_game/models/placement.dart';

class Architect implements Player {
  List<Placement>? canMove(List<Placement> path) {
    return null;
  }
  
  @override
  int team;

  Architect(this.team);
}
