import 'package:flutter/material.dart';

class BreedDropdown extends StatefulWidget {
  final List<String>? breedList;
  final Function(String?) onChanged;
  static String breed = "affenpinscher";

  const BreedDropdown(
      {super.key, required this.breedList, required this.onChanged});

  @override
  State<BreedDropdown> createState() => _BreedDropdownState();
}

class _BreedDropdownState extends State<BreedDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Select Breed'),
      value: BreedDropdown.breed,
      onChanged: (String? newValue) {
        setState(() {
          BreedDropdown.breed = newValue!;
        });
        widget.onChanged(newValue!); // Call the onChanged callback
      },
      items: widget.breedList!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(_capitalizeFirstLetter(
              value)), // Display each breed name with the first letter capitalized
        );
      }).toList(),
      isExpanded: true,
      itemHeight: 48,
      iconSize: 36,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      style: TextStyle(fontSize: 25, color: Colors.black),
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
