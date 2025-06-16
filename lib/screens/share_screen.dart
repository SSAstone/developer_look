import 'package:developer_look/controllers/share_controller.dart';
import 'package:developer_look/core/app_colors.dart';
import 'package:developer_look/widgets/common/button.dart';
import 'package:developer_look/widgets/form/date_input.dart';
import 'package:developer_look/widgets/form/image_input.dart';
import 'package:developer_look/widgets/form/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class ShareScreen extends StatelessWidget {
   ShareScreen({super.key});

  final ShareController controller = Get.put(ShareController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Share", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      IconButton(icon: Icon(Icons.close), onPressed: () => Get.back()),
                    ],
                  ),
                  ImageInput(
                    controller: controller.imageHelper,
                    imagePath: null,
                  ),
                  const SizedBox(height: 16),
                  SearchInput(items: controller.departureList, labelText: "Departure Airport", controller: controller.departure.value, require: true),
                  const SizedBox(height: 16),
                  SearchInput(items: controller.arrivalList, labelText: "Arrival Airport", controller: controller.arrival.value, require: true),
                  const SizedBox(height: 16),
                  SearchInput(
                    items: controller.airlineList,
                    labelText: "Airline",
                    controller: controller.airport.value,
                    require: true,
                  ),
                  const SizedBox(height: 16),
                  SearchInput(
                    items: controller.travelClassList,
                    labelText: "Class",
                    controller: controller.travelClass.value,
                    require: true,
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: controller.message.value,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 16),
              
                  Row(
                    children: [
                      Expanded(
                        child: DateInput(labelText: "Travel Date", controller: controller.date.value, require: true),
                      ),                      
              
                      const SizedBox(width: 12),
              
                      const Text("Rating", style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(width: 8),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 24,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (r) => controller.rating.value = r,
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 24),
              
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                      onPressed: () {
                        controller.submitShare();
                      },
                      text: "Submit",
                    ),
                  ),
                   const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
