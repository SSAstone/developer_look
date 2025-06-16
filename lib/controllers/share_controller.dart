import 'package:developer_look/helpers/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareController extends GetxController {
  final dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

final formKey = GlobalKey<FormState>();

   final TextEditingController myController = TextEditingController();
  final Rx<TextEditingController> date = TextEditingController().obs;
   final ImagePickerHelper imageHelper = ImagePickerHelper(); 
  
}