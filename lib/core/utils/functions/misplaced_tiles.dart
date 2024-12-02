import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';

int misplacedTiles(PuzzleState state, List<List<int>> goal) =>
    state.misplacedTiles(goal);
