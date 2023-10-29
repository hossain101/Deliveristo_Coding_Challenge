import 'package:flutter/material.dart';

class SubBreedDropdown extends StatefulWidget {
  final List<String>? subBreedList;
  final Function(String?) onChanged;

  const SubBreedDropdown({
    super.key,
    required this.subBreedList,
    required this.onChanged,
  });

  @override
  State<SubBreedDropdown> createState() => _SubBreedDropdownState();
}

class _SubBreedDropdownState extends State<SubBreedDropdown> {
  late String? subBreed = widget.subBreedList![0];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Select Breed'),
      value: subBreed, // Use the instance variable here
      onChanged: (String? newValue) {
        setState(() {
          subBreed = newValue!; // And here
        });
        widget.onChanged(newValue);
      },
      items: widget.subBreedList!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(_capitalizeFirstLetter(value)),
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
