import 'package:comp_401_project/views/home/widgets/custom_grid_view_item_builder.dart';
import 'package:flutter/material.dart';

class CustomHomeGridView extends StatelessWidget {
  const CustomHomeGridView({super.key, required this.numbers});
  final List<List<int>> numbers;
  @override
  Widget build(BuildContext context) {
    List<String> oneDimensionArray = convertToOneDimenstionArray(numbers);
    int blankIndex = oneDimensionArray.indexOf('0');
    oneDimensionArray[blankIndex] = '';
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (context, index) => CustomGridViewItemBuilder(
            number: oneDimensionArray[index],
          ),
          itemCount: 9,
        ),
      ),
    );
  }

  List<String> convertToOneDimenstionArray(List<List<int>> numbers) {
    List<String> oneDimensionArray = [];
    for (var element in numbers) {
      for (var value in element) {
        oneDimensionArray.add(value.toString());
      }
    }
    return oneDimensionArray;
  }
}
