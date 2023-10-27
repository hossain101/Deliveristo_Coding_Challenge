import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/api/dog_api.dart'; // Import your DogAPI class
import 'package:deliveristo_coding_challenge/models/dog.dart'; // Import your Dog model
import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart'; // Import your BreedDropdown widget
import 'package:deliveristo_coding_challenge/widgets/sub_breed_dropdown.dart';// Import your SubBreedDropdown widget




class RandomImageScreen extends StatefulWidget {
  @override
  _RandomImageScreenState createState() => _RandomImageScreenState();
}
// ...

class _RandomImageScreenState extends State<RandomImageScreen> {
  String selectedBreed = "labrador"; // Default breed
  String selectedSubBreed = ""; // Default sub-breed (empty for breeds without sub-breeds)
  String imageURL = ""; // Variable to store the image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dog Image by Breed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Breed Dropdown
            BreedDropdown(
              breeds: ["labrador", "bulldog", "poodle"],
              selectedBreed: selectedBreed,
              onChanged: (String? newValue) { // Use String? instead of String
                if (newValue != null) {
                  setState(() {
                    selectedBreed = newValue;
                  });
                }
              },
            ),

            // Sub-Breed Dropdown (if applicable)
            if (selectedBreed == "labrador" || selectedBreed == "bulldog")
              SubBreedDropdown(
                subBreeds: ["golden", "black"],
                selectedSubBreed: selectedSubBreed,
                onChanged: (String? newValue) { // Use String? instead of String
                  if (newValue != null) {
                    setState(() {
                      selectedSubBreed = newValue;
                    });
                  }
                },
              ),

            // Fetch Random Image Button
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await DogAPI.fetchRandomDogImageByBreed(selectedBreed, selectedSubBreed);
                  setState(() {
                    imageURL = result['message'];
                  });
                } catch (e) {
                  print("Error fetching dog image: $e");
                }
              },
              child: Text('Fetch Random Dog Image'),
            ),

            // Display Dog Image
            if (imageURL.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                child: Image.network(
                  imageURL,
                  width: 300,
                  height: 300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
