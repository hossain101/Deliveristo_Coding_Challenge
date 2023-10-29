import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class ListImageSubBreed extends StatelessWidget {
  final String breed;
  final String subBreed;

  const ListImageSubBreed(
      {super.key, required this.breed, required this.subBreed});

  Future<List<String>> getDogImages() async {
    return DogAPI.fetchDogImagesListBySubBreed(breed, subBreed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$breed - $subBreed"),
      ),
      body: FutureBuilder<List<String>>(
        future: getDogImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No images available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data![index];
                return Card(
                  child: Column(
                    children: [
                      Text('Image ${index + 1}'), // Display the image number
                      Image.network(imageUrl), // Display the image
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
