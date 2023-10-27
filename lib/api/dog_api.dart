import 'dart:convert';

import '../utils/network_utils.dart'; // Import your network utility file

class DogAPI {
  static const String baseURL = "https://dog.ceo/api";

  //fetch random sub-breed image
  static Future<Map<String, dynamic>> fetchRandomDogImageSubBreed(
      String breed, String subBreed) async {
    final response = await NetworkUtils.getData(
        'https://dog.ceo/api/breed/$breed/$subBreed/images/random');

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog image');
    }
  }

  //fetch random breed image
  static Future<Map<String, dynamic>> fetchRandomDogImageBreed(
      String breed) async {
    print('$baseURL/breed/$breed/images/random');
    final response =
        await NetworkUtils.getData('$baseURL/breed/$breed/images/random');

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog image');
    }
  }

  // list all breeds get

  static Future<List<String>> fetchDogBreedsList() async {
    final response = await NetworkUtils.getData('$baseURL/breeds/list/all');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['message'].keys);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog breeds');
    }
  }

  // list all sub breeds get
  // static Future<Map<String, dynamic>> fetchRandomDogImageByBreed(
  //     String breed, String subBreed) async {
  //   final response = await NetworkUtils.getData(
  //       '$baseURL/breeds/image/random/${breed.toLowerCase()}${subBreed.isNotEmpty ? '/$subBreed' : ''}');
  //
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     print('Error response: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     throw Exception('Failed to load dog image');
  //   }
  // }

  static Future<List<String>> fetchDogImagesListByBreed(
      String breed, String subBreed) async {
    final response = await NetworkUtils.getData(
        '$baseURL/breed/$breed${subBreed.isNotEmpty ? '/$subBreed' : ''}/images');

    final test = await NetworkUtils.getData(
        'https://dog.ceo/api/breed/hound/images/random/2');

    if (test.statusCode == 200) {
      final data = json.decode(test.body);
      return List<String>.from(data['message']);
    } else {
      print('Error response: ${test.statusCode}');
      print('Response body: ${test.body}');
      throw Exception('Failed to load dog image');
    }
  }
}
