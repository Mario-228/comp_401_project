bool isSolvable(List<List<int>> startState, List<List<int>> goalState) {
  // Flatten the 2D boards into 1D lists, ignoring the blank tile (0).
  List<int> flattenedStart =
      startState.expand((row) => row).where((tile) => tile != 0).toList();
  List<int> flattenedGoal =
      goalState.expand((row) => row).where((tile) => tile != 0).toList();

  int startInversions = 0;
  int goalInversions = 0;

  // Count inversions in the start state.
  for (int i = 0; i < flattenedStart.length; i++) {
    for (int j = i + 1; j < flattenedStart.length; j++) {
      if (flattenedStart[i] > flattenedStart[j]) {
        startInversions++;
      }
    }
  }

  // Count inversions in the goal state.
  for (int i = 0; i < flattenedGoal.length; i++) {
    for (int j = i + 1; j < flattenedGoal.length; j++) {
      if (flattenedGoal[i] > flattenedGoal[j]) {
        goalInversions++;
      }
    }
  }
  return (startInversions % 2) == (goalInversions % 2);
}
