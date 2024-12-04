class PuzzleState {
  final List<List<int>> board;
  final int moves;
  final PuzzleState? parent;

  PuzzleState(this.board, this.moves, this.parent);

  int misplacedTiles(List<List<int>> goalState) {
    int count = 0;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] != 0 && board[i][j] != goalState[i][j]) {
          count++;
        }
      }
    }
    return count;
  }

  int manhattanDistance(List<List<int>> goalState) {
    int distance = 0;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] != 0) {
          for (int r = 0; r < goalState.length; r++) {
            for (int c = 0; c < goalState[r].length; c++) {
              if (goalState[r][c] == board[i][j]) {
                distance += (i - r).abs() + (j - c).abs();
              }
            }
          }
        }
      }
    }
    return distance;
  }

  bool isGoal(List<List<int>> goalState) {
    return board.toString() == goalState.toString();
  }

  List<PuzzleState> generateNeighbors() {
    final neighbors = <PuzzleState>[];
    final blankPos = findBlank();
    final directions = [
      [0, 1], // Right
      [1, 0], // Down
      [0, -1], // Left
      [-1, 0], // Up
    ];

    for (var dir in directions) {
      int newRow = blankPos[0] + dir[0];
      int newCol = blankPos[1] + dir[1];

      if (newRow >= 0 && newRow < 3 && newCol >= 0 && newCol < 3) {
        List<List<int>> newBoard = copyBoard(board);
        newBoard[blankPos[0]][blankPos[1]] = newBoard[newRow][newCol];
        newBoard[newRow][newCol] = 0;

        neighbors.add(PuzzleState(newBoard, moves + 1, this));
      }
    }
    return neighbors;
  }

  List<int> findBlank() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == 0) {
          return [i, j];
        }
      }
    }
    throw Exception("Blank tile not found");
  }

  static List<List<int>> copyBoard(List<List<int>> board) {
    return board.map((row) => List<int>.from(row)).toList();
  }

  @override
  bool operator ==(Object other) =>
      other is PuzzleState && board.toString() == other.board.toString();

  @override
  int get hashCode => board.toString().hashCode;
}
