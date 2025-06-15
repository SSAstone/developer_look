import 'package:developer_look/controllers/share_controller.dart';
import 'package:developer_look/widgets/common/button.dart';
import 'package:developer_look/widgets/form/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class ShareScreen extends StatefulWidget {
  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  String? departure;
  String? arrival;
  String? airline;
  String? travelClass;
  double rating = 0;
  DateTime? travelDate;

  final TextEditingController messageController = TextEditingController();
  final ShareController controller = Get.put(ShareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
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
                  Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                      // borderStyle: BorderStyle.solid,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade100, blurRadius: 3),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.upload, size: 40, color: Colors.black45),
                          SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              text: 'Drop Your Image Here Or ',
                              children: [
                                TextSpan(
                                  text: 'Browse',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SearchInput(items: controller.dummyList, labelText: "Departure Airport", controller: controller.myController),
                  const SizedBox(height: 16),
              
                  TextField(
                    controller: messageController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      filled: true,
                      fillColor: Colors.grey.shade100,
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
                        child: GestureDetector(
                          onTap: _pickDate,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 18),
                                const SizedBox(width: 8),
                                Text(travelDate != null
                                    ? DateFormat('yyyy-MM-dd').format(travelDate!)
                                    : 'Travel Date'),
                              ],
                            ),
                          ),
                        ),
                      ),
              
                      const SizedBox(width: 12),
              
                      const Text("Rating", style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(width: 8),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 24,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (r) => setState(() => rating = r),
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 24),
              
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                      onPressed: () {
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

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        travelDate = picked;
      });
    }
  }
}
