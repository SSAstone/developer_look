import 'package:developer_look/core/app_colors.dart';
import 'package:developer_look/helpers/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInput extends StatelessWidget {
  final ImagePickerHelper controller;
  final String? imagePath;

  const ImageInput({
    super.key,
    required this.controller,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: 160,
              child: Obx(
                () => CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.white,
                  child: controller.imageFile.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            controller.imageFile.value!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : controller.defaultImage.value.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                controller.defaultImage.value,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload, size: 40, color: Colors.black45),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Drop Your Image Here Or ",
                                  style: TextStyle(color: Colors.black45)),
                              InkWell(
                                onTap: () {
                                  controller.pickImageGallery();
                                },
                                child: Text(
                                   'Browse',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                onSelected: (value) {
                  if (value == 'Gallery') {
                    controller.pickImageGallery();
                  } else if (value == 'Camera') {
                    controller.pickImageFromCamera();
                  }
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry<String>> menuItems = [
                    const PopupMenuItem<String>(
                      value: 'Gallery',
                      child: Text('Pick Image from Gallery'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Camera',
                      child: Text('Pick Image from Camera'),
                    ),
                  ];

                  if (controller.imageFile.value != null ||
                      (imagePath != null && imagePath!.isNotEmpty)) {
                    menuItems.add(
                      const PopupMenuItem<String>(
                        value: 'remove',
                        child: Text('Remove Image'),
                      ),
                    );
                  }

                  return menuItems;
                },
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
