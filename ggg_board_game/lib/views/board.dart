import 'package:flutter/material.dart';


class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "aaa",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("aaa"),
        ),
        body: GridView.count(
          crossAxisCount: 5,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}

