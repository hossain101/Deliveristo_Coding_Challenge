import 'package:flutter/material.dart';

class SubBreedDropdown extends StatelessWidget {
  final List<String> subBreeds;
  final String selectedSubBreed;
  final Function(String?) onChanged;

  SubBreedDropdown({
    required this.subBreeds,
    required this.selectedSubBreed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedSubBreed,
      onChanged: onChanged,
      items: subBreeds.map((String subBreed) {
        return DropdownMenuItem<String>(
          value: subBreed, // Use a unique value for each sub-breed
          child: Text(subBreed),
        );
      }).toList(),
    );
  }
}