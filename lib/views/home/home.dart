import 'package:comp_401_project/core/utils/functions/manhattan_distance.dart';
//import 'package:comp_401_project/core/utils/functions/misplaced_tiles.dart';
import 'package:comp_401_project/views/home/widgets/initial_and_goal_state_8_puzzle.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InitialAndGoalState8Puzzle(
          goalState: getRandomPuzzle(),
          initialState: getRandomPuzzle(),
          heuristic: manhattanDistance,
        ),
      ),
    );
  }

  List<List<int>> getRandomPuzzle() {
    List<List<int>> numbers = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 0]
    ];
    for (var row in numbers) {
      row.shuffle();
    }
    numbers.shuffle();
    return numbers;
  }
}
