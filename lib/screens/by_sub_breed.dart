import 'package:deliveristo_coding_challenge/screens/random_image_sub_breed.dart';
import 'package:deliveristo_coding_challenge/widgets/sub_breed_dropdown.dart';
import 'package:flutter/material.dart';

import '../api/dog_api.dart';
import '../widgets/breed_dropdown.dart';
import 'list_image_sub_breed.dart';

class By_SubBreed extends StatefulWidget {
  By_SubBreed({super.key});

  @override
  State<By_SubBreed> createState() => _Random_By_SubBreed();
}

class _Random_By_SubBreed extends State<By_SubBreed> {
  String breed = "affenpinscher";
  String subBreed = "";

  List<String>? breedList = [];
  List<String>? subBreedList = [];

  Future<void> fetchBreeds() async {
    breedList = await DogAPI.fetchDogBreedsList();
    // print("Fetched breedList: $breedList");
  }

  Future<List<String>?> fetchSubBreeds() async {
    subBreedList = await DogAPI.fetchDogSubBreedsList(breed);

    // print("Fetched subBreedList for $breed: $subBreedList");

    return subBreedList;
  }

  @override
  initState() {
    super.initState();

    fetchBreeds().then((value) => fetchSubBreeds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Image by Sub-Breed'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchBreeds(), // Load breedList asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Check if fetching breeds is done
                  return BreedDropdown(
                    breedList: breedList,
                    onChanged: (String? newValue) {
                      breed = newValue!;

                      fetchSubBreeds().then((value) => setState(() {}));
                    },
                  );
                } else if (snapshot.hasError) {
                  // Handle error
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: breedList!.isNotEmpty
                  ? fetchSubBreeds()
                  : Future.value(subBreedList),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child:
                        CircularProgressIndicator(), // Center the loading indicator
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Error: ${snapshot.error}"), // Display error message
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child:
                        Text("No data available."), // Display no data message
                  );
                } else {
                  subBreedList = snapshot.data;
                  return Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(
                        20), // Add padding to the container
                    child: SubBreedDropdown(
                      subBreedList: subBreedList,
                      onChanged: (String? newValue) {
                        subBreed = newValue!;
                      },
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RandomImageSubBreed(
                            breed: breed, subBreed: subBreed)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Show Random Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListImageSubBreed(
                            breed: breed, subBreed: subBreed)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('List Images'),
            ),
          ],
        ),
      ),
    );
  }
}
