import 'package:comp_401_project/core/utils/functions/manhattan_distance.dart';
import 'package:comp_401_project/core/utils/functions/misplaced_tiles.dart';
//import 'package:comp_401_project/core/utils/functions/misplaced_tiles.dart';
import 'package:comp_401_project/views/home/widgets/initial_and_goal_state_8_puzzle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  static const heuristics = {
    'Manhattan Distance': manhattanDistance,
    'Misplaced Tiles': misplacedTiles,
  };
  static String selectedHeuristic = 'Manhattan Distance';
  static var randomPuzzle = getRandomPuzzle();
  static var randomPuzzle2 = getRandomPuzzle();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var functions = [manhattanDistance, misplacedTiles];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Select Huristic: "),
            DropdownButton<String>(
              value: Home.selectedHeuristic,
              items: Home.heuristics.keys.map((String heuristic) {
                return DropdownMenuItem<String>(
                  value: heuristic,
                  child: Text(heuristic),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  Home.selectedHeuristic = value!;
                });
              },
            ),
            InitialAndGoalState8Puzzle(
              goalState: Home.randomPuzzle,
              initialState: Home.randomPuzzle2,
              heuristic: Home.heuristics[Home.selectedHeuristic],
              isManhattan: Home.selectedHeuristic == 'Manhattan Distance',
            ),
          ],
        ),
      ),
    );
  }
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
