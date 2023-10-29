import 'dart:convert';

import '../utils/network_utils.dart'; // Import your network utility file

class DogAPI {
  static const String baseURL = "https://dog.ceo/api";

  //fetch random sub-breed image
  static Future<Map<String, dynamic>> fetchRandomDogImageSubBreed(
      String breed, String subBreed) async {
    print('$baseURL/breed/$breed/$subBreed/images/random');
    final response = await NetworkUtils.getData(
        '$baseURL/breed/$breed/$subBreed/images/random');

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

  static Future<List<String>> fetchDogSubBreedsList(String breed) async {
    final response = await NetworkUtils.getData('$baseURL/breed/$breed/list');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['message']);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog sub breeds');
    }
  }

  //Array of all the images for the breed

  static Future<List<String>> fetchDogImagesListByBreed(String breed) async {
    final response = await NetworkUtils.getData('$baseURL/breed/$breed/images');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['message']);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog image');
    }
  }

  //Array of all the images for the sub-breed

  static Future<List<String>> fetchDogImagesListBySubBreed(
      String breed, String subBreed) async {
    final response =
        await NetworkUtils.getData('$baseURL/breed/$breed/$subBreed/images');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['message']);
    } else {
      print('Error response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load dog image');
    }
  }
}
