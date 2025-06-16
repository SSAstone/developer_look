import 'dart:convert';
import 'package:developer_look/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Instance {
  static Future<Map<String, dynamic>?> get(String url) async {
    print('Fetching URL: ${ApiEndPoints.baseUrl}$url');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Ensure token is not null
      if (token == null || token.isEmpty) {
        print('Error: Token is missing');
        // return null;
      }

      final response = await http.get(
        Uri.parse('${ApiEndPoints.baseUrl}$url'), // Proper URL formation
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      // Decode response
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Response: $data');

      // Check success and status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['success'] == true) {
          return data;
        } else {
          print('API Error: ${data['message']}');
          // Get.snackbar('Error', data['message']);
          return null;
        }
      } else {
        print('HTTP Error: ${response.statusCode} - ${data['message']}');
        // Get.snackbar('Error', data['message'] ?? 'Unknown error');
        return null;
      }
    } catch (e) {
      print('Network Error: $e');
      Get.snackbar('Error', 'Failed to connect to server');
      return null;
    }
  }

  static Future<dynamic> post(String url, dynamic body) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      print('url ------------: $url');

      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      final data = jsonDecode(response.body);
      print('data ------------: $data');
      if ((data['success'] && response.statusCode == 201 ||
          response.statusCode == 200)) {
        return data;
      } else {
        if (data['errors'] != null && data['errors'].length > 0) {
          // Get.snackbar('Error', data['errors'][0]);
          return data;
        } else {
          return data;
          // Get.snackbar('Error', data['message']);
        }
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred: $e');
      print("Post Error: $e");
      return null;
    }
  }

  static Future<dynamic> put(String url, dynamic body) async {
    print('url ------------: $url');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await http.put(
        Uri.parse(ApiEndPoints.baseUrl + url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Get.snackbar('Error', 'Failed to post data');
        // Get.snackbar('Error', 'Failed to post data');
        print('Failed to post data');
        return null;
      }
    } catch (e) {
      print("put Error: $e");
      // Get.snackbar('Error', 'An error occurred: $e');
      return null;
    }
  }

  static Future<dynamic> delete(String url) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final response = await http.delete(
        Uri.parse(ApiEndPoints.baseUrl + url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final data = jsonDecode(response.body);
      print('data ------------: $data');
      if ((data['success'] && response.statusCode == 201 ||
          response.statusCode == 200)) {
        return data;
      } else {
        if (data['errors'] != null && data['errors'].length > 0) {
          Get.snackbar('Error', data['errors'][0]);
        } else {
          Get.snackbar('Error', data['message']);
        }
        return data;
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred: $e');
      print("Delete Error: $e");
      return null;
    }
  }
}
