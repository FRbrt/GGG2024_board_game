import 'package:ggg_board_game/models/player.dart';
import 'package:ggg_board_game/models/placement.dart';

class Acrobat implements Player {

  List<Placement>? canMove(List<Placement> path) {
    return null;
  }
  
  @override
  int team;

  Acrobat(this.team);
}
