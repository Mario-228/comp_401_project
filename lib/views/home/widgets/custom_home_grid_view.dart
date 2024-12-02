import 'package:comp_401_project/views/home/widgets/custom_grid_view_item_builder.dart';
import 'package:flutter/material.dart';

class CustomHomeGridView extends StatelessWidget {
  const CustomHomeGridView({super.key, required this.numbers});
  final List<String> numbers;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 250.0,
        width: 250.0,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (context, index) =>
              CustomGridViewItemBuilder(number: numbers[index]),
          itemCount: 9,
        ),
      ),
    );
  }
}
