import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';

List<PuzzleState> getSolution(PuzzleState? state) {
  if (state == null) {
    //print("No solution found!");
    return [];
  }

  final solutionPath = <PuzzleState>[];
  while (state != null) {
    solutionPath.add(state);
    state = state.parent;
  }

  return solutionPath.reversed.toList();
}
