import 'dart:convert';
import 'dart:io';

import 'package:developer_look/helpers/instance.dart';
import 'package:developer_look/utils/api_endpoints.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class ImagePickerHelper {
  final picker = ImagePicker();
  final Rx<File?> imageFile = Rx<File?>(null);

  RxString defaultImage = ''.obs;

  Future<void> pickImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<String?> uploadImage([bool require = false]) async {
    if (imageFile.value != null) {
      try {
        if (defaultImage.value.isNotEmpty) {
          print('delete image---------------${defaultImage.value}');
          final response = await Instance.post('/upload-image/delete', {
            'file': defaultImage.value,
          });
          print('response-------------------: $response');
        }

        File compressedImageFile = await compressImage(imageFile.value!);
        String fileExtension =
            path.extension(compressedImageFile.path).toLowerCase();

        String mimeType;
        switch (fileExtension) {
          case '.jpg':
          case '.jpeg':
            mimeType = 'image/jpeg';
            break;
          case '.png':
            mimeType = 'image/png';
            break;
          case '.gif':
            mimeType = 'image/gif';
            break;
          default:
            mimeType = 'application/octet-stream';
        }

        var request = http.MultipartRequest(
            'POST', Uri.parse('${ApiEndPoints.baseUrl}/upload-image'));
        var pic = await http.MultipartFile.fromPath(
          'image',
          compressedImageFile.path,
          contentType: MediaType.parse(mimeType),
        );
        request.files.add(pic);
        var response = await request.send();

        print('Image upload response status code: ${response.statusCode}');
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        print('Image upload response body: $responseString');

        if (response.statusCode == 201) {
          var responseJson = jsonDecode(responseString);
          print('Uploaded image data: ${responseJson['data']}');
          // defaultImage.value = responseJson['data'];
          // image.value = responseJson['data'];
          return responseJson['data'];
        } else {
          print('Image upload failed with status code: ${response.statusCode}');
          return null;
        }
      } catch (e) {
        print('Exception during image upload: $e');
        return null;
      }
    } else {
      if (require) {
        // Get.snackbar('Error', 'No image selected to upload.');
        return null;
      } else {
        return null;
      }
    }
  }

  Future<File> compressImage(File file) async {
    final filePath = file.absolute.path;

    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitFilePath = filePath.substring(0, lastIndex);
    final outPath = "${splitFilePath}_out${filePath.substring(lastIndex)}";

    XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 50,
    );

    if (result != null) {
      return File(result.path);
    } else {
      return file;
    }
  }
}
