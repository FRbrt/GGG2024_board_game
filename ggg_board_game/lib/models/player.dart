import 'package:ggg_board_game/models/placement.dart';

abstract class Player implements Placement {
  List<Placement>? canMove(List<Placement> path);
}
