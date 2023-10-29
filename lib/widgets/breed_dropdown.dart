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
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.deepPurple[200],
      ),
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
          child: Center(
            child: Text(_capitalizeFirstLetter(value)),
          ), // Display each breed name with the first letter capitalized
        );
      }).toList(),
      isExpanded: true,
      itemHeight: 60,
      iconSize: 36,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
