import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';
import 'package:comp_401_project/views/home/widgets/custom_home_grid_view.dart';
import 'package:flutter/material.dart';

class ShowPath extends StatelessWidget {
  const ShowPath(
      {super.key,
      required this.path,
      this.isManhattan = false,
      required this.goal});
  final List<PuzzleState> path;
  final bool isManhattan;
  final List<List<int>> goal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 150,
          child: ListView.separated(
              itemBuilder: (context, index) => SizedBox(
                  width: 100,
                  height: 200,
                  child: Column(
                    children: [
                      Text("g(n)=${path[index].moves}"),
                      Text(
                          "h(n)=${isManhattan ? path[index].manhattanDistance(goal) : path[index].misplacedTiles(goal)}"),
                      CustomHomeGridView(numbers: path[index].board),
                    ],
                  )),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: path.length),
        ),
      ),
    );
  }
}
