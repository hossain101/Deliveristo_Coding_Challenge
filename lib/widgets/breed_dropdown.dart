import 'package:flutter/material.dart';

class BreedDropdown extends StatelessWidget {
  final List<String> breeds;
  final String selectedBreed;
  final Function(String?) onChanged;

  BreedDropdown({required this.breeds, required this.selectedBreed, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedBreed,
      onChanged: onChanged,
      items: breeds.map((String breed) {
        return DropdownMenuItem<String>(
          value: breed,
          child: Text(breed),
        );
      }).toList(),
    );
  }
}