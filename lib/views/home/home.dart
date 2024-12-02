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
            heuristic: null),
      ),
    );
  }

  List<String> getRandomPuzzle() {
    List<String> numbers = List.generate(8, (index) => (index + 1).toString());
    numbers.add('');
    numbers.shuffle();
    return numbers;
  }
}
