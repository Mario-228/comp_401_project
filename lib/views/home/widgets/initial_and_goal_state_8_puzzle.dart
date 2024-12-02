import 'package:comp_401_project/views/home/widgets/custom_home_grid_view.dart';
import 'package:flutter/material.dart';

class InitialAndGoalState8Puzzle extends StatelessWidget {
  const InitialAndGoalState8Puzzle({
    super.key,
    required this.initialState,
    required this.goalState,
    required this.heuristic,
  });

  final List<String> initialState;
  final List<String> goalState;
  final void Function(List<String> initialState, List<String> goalState)?
      heuristic;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text("initial State:"),
                  const SizedBox(height: 10.0),
                  CustomHomeGridView(numbers: initialState),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text("Goal State:"),
                  const SizedBox(height: 10.0),
                  CustomHomeGridView(numbers: goalState),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        MaterialButton(
          color: Colors.black,
          height: 50.0,
          minWidth: 200.0,
          shape: const StadiumBorder(),
          onPressed: () {
            if (heuristic != null) {
              heuristic!(initialState, goalState);
            }
          },
          child: const Text("Solve", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
