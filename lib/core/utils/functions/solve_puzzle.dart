import 'package:collection/collection.dart';
import 'package:comp_401_project/core/utils/functions/is_solvable.dart';
import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';

PuzzleState? solvePuzzle(List<List<int>> startState, List<List<int>> goalState,
    int Function(PuzzleState, List<List<int>>) heuristic) {
  if (!isSolvable(startState, goalState)) {
    return null;
  }
  final priorityQueue = PriorityQueue<PuzzleState>((a, b) =>
      (heuristic(a, goalState) + a.moves) -
      (heuristic(b, goalState) + b.moves));
  final visited = <PuzzleState>{};

  PuzzleState start = PuzzleState(startState, 0, null);
  priorityQueue.add(start);

  while (priorityQueue.isNotEmpty) {
    PuzzleState current = priorityQueue.removeFirst();

    if (current.isGoal(goalState)) {
      return current;
    }

    if (visited.contains(current)) continue;
    visited.add(current);

    for (var neighbor in current.generateNeighbors()) {
      if (!visited.contains(neighbor)) {
        priorityQueue.add(neighbor);
      }
    }
  }
  return null;
}


// void main() {
//   final startState = [
//     [1, 2, 3],
//     [4, 0, 5],
//     [7, 8, 6]
//   ];

//   final goalState = [
//     [1, 2, 3],
//     [4, 5, 6],
//     [7, 0, 8]
//   ];

//   // Define the heuristic function: misplaced tiles
//   int heuristicFunction(PuzzleState state, List<List<int>> goal) {
//     return state.misplacedTiles(goal);
//   }

//   PuzzleState? solution = solvePuzzle(startState, goalState, heuristicFunction);
//   getSolution(solution);
// }
