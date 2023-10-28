import 'package:deliveristo_coding_challenge/screens/random_image_breed.dart';
import 'package:deliveristo_coding_challenge/screens/random_image_sub_breed.dart';
import 'package:deliveristo_coding_challenge/widgets/sub_breed_dropdown.dart';
import 'package:flutter/material.dart';

import '../api/dog_api.dart';
import '../widgets/breed_dropdown.dart';

class Random_By_SubBreed extends StatefulWidget {
  Random_By_SubBreed({super.key});

  @override
  State<Random_By_SubBreed> createState() => _Random_By_SubBreed();
}

class _Random_By_SubBreed extends State<Random_By_SubBreed> {
  String breed = "affenpinscher";
  String subBreed = "";

  List<String>? breedList = [];
  List<String>? subBreedList = [];

  Future<void> fetchBreeds() async {
    breedList = await DogAPI.fetchDogBreedsList();
    print("Fetched breedList: $breedList");
  }

  Future<List<String>?> fetchSubBreeds() async {
    subBreedList = await DogAPI.fetchDogSubBreedsList(breed);

    print("Fetched subBreedList for $breed: $subBreedList");

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
      // Wrap your widget with a Scaffold
      appBar: AppBar(
        title:
            const Text('Random Image by Sub-Breed'), // Set your app bar title
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
                  // While loading, show a loading indicator
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: breedList!.isNotEmpty
                  ? fetchSubBreeds()
                  : Future.value(subBreedList),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child:
                        CircularProgressIndicator(), // Center the loading indicator
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Error: ${snapshot.error}"), // Display error message
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child:
                        Text("No data available."), // Display no data message
                  );
                } else {
                  subBreedList = snapshot.data;
                  return Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(20), // Add padding to the container
                    child: SubBreedDropdown(
                      subBreedList: subBreedList,
                      onChanged: (String? newValue) {
                        this.subBreed = newValue!;
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
                    await MaterialPageRoute(
                        builder: (context) => RandomImageSubBreed(
                            breed: breed, subBreed: subBreed)));
              },
              child: Text('Show Random Image'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20),
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
