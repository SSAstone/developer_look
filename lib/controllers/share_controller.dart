import 'dart:convert';
import 'package:developer_look/controllers/feed_controller.dart';
import 'package:developer_look/models/feed_model.dart';
import 'package:http/http.dart' as http;

import 'package:developer_look/helpers/image_picker.dart';
import 'package:developer_look/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareController extends GetxController {
  final feedController = Get.put(FeedController());


  final List<String> departureList = [];
  final List<String> arrivalList = [];
  final List<String> airlineList = [];
  final List<String> travelClassList = ['Economy', 'Business', 'First Class'];
  final Rx<TextEditingController> arrival = TextEditingController().obs;
  final Rx<TextEditingController> airline = TextEditingController().obs;
  final Rx<TextEditingController> travelClass = TextEditingController().obs;
  final Rx<TextEditingController> message = TextEditingController().obs;
  final RxDouble rating = 0.0.obs;
  final Rx<DateTime> travelDate = DateTime.now().obs;

  final formKey = GlobalKey<FormState>();

  final Rx<TextEditingController> departure = TextEditingController().obs;
  final Rx<TextEditingController> date = TextEditingController().obs;
  final ImagePickerHelper imageHelper = ImagePickerHelper();
  final RxBool isLoading = false.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchMostTrackedFlights();
  }

  Future<void> fetchMostTrackedFlights() async {
    final url = Uri.parse(
      'https://fligtradar24-data.p.rapidapi.com/v1/flights/most-tracked',
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-host': 'fligtradar24-data.p.rapidapi.com',
        'x-rapidapi-key': '527e3ce3demsh6259452c650228cp10c64djsn95f4a045ea4f',
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List flightsJson = jsonBody['data']['data'];

      final data =
          flightsJson.map((json) => FlightModel.fromJson(json)).toList();

      departureList.addAll(
        data.map((flight) => flight.fromCity ?? '').toList(),
      );
      arrivalList.addAll(
        data.map((flight) => flight.toCity ?? '').cast<String>().toList(),
      );
      airlineList.addAll(data.map((flight) => flight.type ?? '').toList());

      print('Fetched ${data.length} flights');
    } else {
      throw Exception('Failed to fetch flights: ${response.statusCode}');
    }
  }

  Future<void> submitShare() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      
      if (departure.value.text.isEmpty ||
          arrival.value.text.isEmpty ||
          airline.value.text.isEmpty ||
          travelClass.value.text.isEmpty ||
          message.value.text.isEmpty) {
        Get.snackbar('Error', 'Please fill all required fields.');
        return;
      }

      final body = {
        "user": {
          "name": "Mark Benson",
          "image": "https://icon-library.com/images/user-icon-png/user-icon-png-17.jpg"
        },
        "time": "2 days ago",
        "rating": rating.value,
        "tags": [departure.value.text, arrival.value.text, airline.value.text, travelClass.value.text],
        "description": message.value.text,
        "likes": 1,
        "comments": 0,
        "images": imageHelper.imageFiles
                    .where((file) => file != null)
                    .map((file) => file!.path)
                    .toList(),
        "commentsList": []
      };
      isLoading.value = true;
      final newPost = FeedModel.fromJson(body);
      feedController.posts.add(newPost);    
      feedController.posts.refresh();
      isLoading.value = false;
      Get.back();

    } else {
      Get.snackbar('Error', 'Please fill all required fields.');
    }
  }
}
