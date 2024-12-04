import 'package:comp_401_project/models/puzzle_state_model/puzzle_state_model.dart';
import 'package:comp_401_project/views/home/widgets/custom_home_grid_view.dart';
import 'package:flutter/material.dart';

class ShowPath extends StatelessWidget {
  const ShowPath({super.key, required this.path});
  final List<PuzzleState> path;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Container(
                  height: width,
                  child: CustomHomeGridView(numbers: path[index].board)),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: path.length),
        ),
      ),
    );
  }
}
