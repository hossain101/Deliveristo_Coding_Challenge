# UI
<img src="https://github.com/hossain101/deliveristo_coding_challenge/assets/80954453/1b3a2022-3ec8-4bc3-b706-90cf31516f30" width="150" height="300" alt="Dashboard">

<img src="https://github.com/hossain101/deliveristo_coding_challenge/assets/80954453/47a75e78-9c43-4c5b-8557-6c5fa20c9f6e" width="150" height="300" alt="By Breed">


<img src="https://github.com/hossain101/deliveristo_coding_challenge/assets/80954453/b2800b2d-8bc6-4a8a-83cb-2db2e156e496" width="150" height="300" alt="By Sub Breed">


# Architecture
- This app is using a simple MVVM (Model-View-ViewModel) architecture to separate UI code from business logic. 
- This will help maintain a clean and organized codebase.

deliveristo_coding_challenge/
├── lib/
│   ├── main.dart
│   ├── api/
│   │   └── dog_api.dart
│   ├── models/
│   ├── screens/
│   │   ├── by_breed.dart
│   │   ├── by_sub_breed.dart
│   │   ├── home_screen.dart
│   │   ├── list_image_breed.dart
│   │   ├── list_image_sub_breed.dart
│   │   ├── random_image_sub_breed.dart
│   │   └── random_image_breed.dart
│   ├── widgets/
│   │   ├── breed_dropdown.dart
│   │   ├── dashboard_card.dart
│   │   └── sub_breed_dropdown.dart
│   └── utils/
│       └── network_utils.dart


# Dependencies
- http: ^1.1.0

# How To Run

- Clone this repository
- Run `flutter pub get`
- Run `flutter run` (remember open simulator or connect physical device, iOS auto run additional command `pod install`)

*NOTE*
- This APP was tested on Nexus 5X API 28 (Android R) emulator.
- To make sub-breed list button visible, you have to select a breed with sub-breed available e.g. "hound","bulldog","mastiff","retriever","sheepdog","terrier".
# Testing Done
- Unit tests for functions in the dog_api.dart and network_utils.dart files were carried out. 
- Additionally, end-to-end (E2E) tests were done to cover the typical user flow described above.
# Author
- [Shoaib Hossain]
- [LinkedIn](https://www.linkedin.com/in/shoaib-hossain-5bb080236/)
  

