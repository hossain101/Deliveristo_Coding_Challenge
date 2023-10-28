import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/api/dog_api.dart'; // Import your DogAPI class
import 'package:deliveristo_coding_challenge/models/dog.dart'; // Import your Dog model
import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart'; // Import your BreedDropdown widget
import 'package:deliveristo_coding_challenge/widgets/sub_breed_dropdown.dart'; // Import your SubBreedDropdown widget
//
// class ImageListScreen extends StatefulWidget {
//   @override
//   _ImageListScreenState createState() => _ImageListScreenState();
// }
// // ...
//
// class _ImageListScreenState extends State<ImageListScreen> {
//   String selectedBreed = "labrador"; // Default breed
//   String selectedSubBreed = ""; // Default sub-breed (empty for breeds without sub-breeds)
//   List<String> imageList = []; // List to store image URLs
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dog Images List by Breed'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Breed Dropdown
//             BreedDropdown(
//               breeds: ["labrador", "bulldog", "poodle"],
//               selectedBreed: selectedBreed,
//               onChanged: (String? newValue) { // Use String? instead of String
//                 if (newValue != null) {
//                   setState(() {
//                     selectedBreed = newValue;
//                     // Reset sub-breed when changing the breed
//                     selectedSubBreed = "";
//                   });
//                 }
//               },
//             ),
//
//             // Sub-Breed Dropdown (if applicable)
//             if (selectedBreed == "labrador" || selectedBreed == "bulldog")
//               SubBreedDropdown(
//                 subBreeds: ["golden", "black"],
//                 selectedSubBreed: selectedSubBreed,
//                 onChanged: (String? newValue) { // Use String? instead of String
//                   if (newValue != null) {
//                     setState(() {
//                       selectedSubBreed = newValue;
//                     });
//                   }
//                 },
//               ),
//
//             // Fetch Image List Button
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   final resultList = await DogAPI.fetchDogImagesListByBreed(selectedBreed, selectedSubBreed);
//                   setState(() {
//                     imageList = resultList;
//                   });
//                 } catch (e) {
//                   print("Error fetching dog images: $e");
//                 }
//               },
//               child: Text('Fetch Dog Images List'),
//             ),
//
//             // Display Dog Image List
//             if (imageList.isNotEmpty)
//               Column(
//                 children: imageList.map((imageURL) {
//                   return Container(
//                     padding: EdgeInsets.all(8),
//                     child: Image.network(
//                       imageURL,
//                       width: 200,
//                       height: 200,
//                     ),
//                   );
//                 }).toList(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
