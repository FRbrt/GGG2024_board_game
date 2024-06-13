
import 'package:flutter/material.dart';
import 'package:ggg_board_game/models/acrobat.dart';
import 'package:ggg_board_game/models/archer.dart';
import 'package:ggg_board_game/models/architect.dart';
import 'package:ggg_board_game/models/placement.dart';
import 'package:ggg_board_game/models/obstacle.dart';
import 'package:ggg_board_game/models/player.dart';

class BoardTile extends StatelessWidget {
  final Placement placement;
  final bool isHighlighted;
  final int column;
  final int row;
  final Function(int, int) onTapped;
  
  const BoardTile({super.key, required this.placement, required this.isHighlighted, required this.onTapped, required this.column, required this.row});

  // @override
  // State<BoardTile> createState() => _BoardTileState();

  @override
  Widget build(BuildContext context) {

  return Container(
      width: 100.0, // width of the square tile
      height: 100.0,
      decoration: boxDecoration(),
      child: TextButton(onPressed: () {
        onTapped(column, row);
        //currentPlayer.action(column, row, position)
        //player.takeResource
      },
      child: icon()
      ),
    );
  }

  Widget icon() {
    if (placement is Obstacle) {
      return const Image(image: AssetImage('assets/obstacole/copac.png'));
    }

    if (placement is Player) {
      var team = (placement as Player).team;

    if (placement is Archer) {
      return Image(image: AssetImage('assets/jucatori/jarcas$team.png'));
    }

    if (placement is Architect) {
      return Image(image: AssetImage('assets/jucatori/jarhitect$team.png'));
    }

    if (placement is Acrobat) {
      return Image(image: AssetImage('assets/jucatori/jacrobat$team.png'));
    }
    }
    
    return Container();
  }

  Color backgroundColor() {
    return isHighlighted ? Colors.yellow : Colors.green;
  }

  BoxDecoration boxDecoration() {
    return true ? BoxDecoration(
      color: backgroundColor(), // Background color// Rounded corners
      boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
      ),
      ],
      ) :
      const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tabere/acrobat1.png"),
            fit: BoxFit.fill,
          ),
        )
      ;
  }
}

// class _BoardTileState extends State<BoardTile> {
//   late Placement _placement;

//   @override
//   void initState() {
//     super.initState();
//     _placement = widget.placement;
//   }
  
// }
