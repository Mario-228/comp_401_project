import 'package:comp_401_project/core/utils/functions/get_solution.dart';
import 'package:comp_401_project/core/utils/functions/show_message.dart';
import 'package:comp_401_project/core/utils/functions/solve_puzzle.dart';
import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';
import 'package:comp_401_project/views/home/widgets/custom_home_grid_view.dart';
import 'package:comp_401_project/views/show_path/show_path.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InitialAndGoalState8Puzzle extends StatefulWidget {
  InitialAndGoalState8Puzzle({
    super.key,
    required this.initialState,
    required this.goalState,
    required this.heuristic,
    this.isManhattan = false,
  });

  List<List<int>> initialState;
  final List<List<int>> goalState;
  final bool isManhattan;
  final int Function(PuzzleState, List<List<int>>)? heuristic;

  @override
  State<InitialAndGoalState8Puzzle> createState() =>
      _InitialAndGoalState8PuzzleState();
}

class _InitialAndGoalState8PuzzleState
    extends State<InitialAndGoalState8Puzzle> {
  @override
  Widget build(BuildContext context) {
    int steps = -1;
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
                  CustomHomeGridView(numbers: widget.initialState),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                children: [
                  const Text("Goal State:"),
                  const SizedBox(height: 10.0),
                  CustomHomeGridView(numbers: widget.goalState),
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
            if (widget.heuristic != null) {
              var solution = solvePuzzle(
                  widget.initialState, widget.goalState, widget.heuristic!);
              if (solution == null) {
                showMessage("No solution found!", context);
              } else {
                setState(() {
                  widget.initialState = solution.board;
                  steps = solution.moves;
                  if (steps != 0) {
                    var path = getSolution(solution);
                    showMessage("Solved in $steps steps", context);
                    if (path.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowPath(
                            path: path,
                            goal: widget.goalState,
                            isManhattan: widget.isManhattan,
                          ),
                        ),
                      );
                    }
                  } else {
                    showMessage("Already Solved", context);
                  }
                });
              }
            }
          },
          child: const Text("Solve", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 20.0),
        MaterialButton(
          color: Colors.black,
          height: 50.0,
          minWidth: 200.0,
          shape: const StadiumBorder(),
          onPressed: () {
            setState(() {
              widget.initialState.shuffle();
            });
          },
          child: const Text("Reset Initial",
              style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 20.0),
        MaterialButton(
          color: Colors.black,
          height: 50.0,
          minWidth: 200.0,
          shape: const StadiumBorder(),
          onPressed: () {},
          child: const Text("Show Path", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
