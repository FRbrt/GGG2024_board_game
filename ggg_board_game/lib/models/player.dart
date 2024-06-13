import 'package:ggg_board_game/models/placement.dart';

abstract class Player implements Placement {
  int team;
  List<Placement>? canMove(List<Placement> path);

  Player(this.team);
}
