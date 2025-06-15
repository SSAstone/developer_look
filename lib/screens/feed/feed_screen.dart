import 'package:developer_look/controllers/feed_controller.dart';
import 'package:developer_look/routes/app_routes.dart';
import 'package:developer_look/screens/feed/feed_card.dart';
import 'package:developer_look/styles/app_colors.dart';
import 'package:developer_look/widgets/common/button.dart';
import 'package:developer_look/widgets/common/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      appBar: AppBar(
        title: const Text(
          'Airline Review',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Button(
                            onPressed: () {
                              Get.toNamed(AppRouters.share);
                            },
                            icon: Icon(Icons.share, color: Colors.white),
                            text: 'Share your experience',
                            fontSize: 12,
                            color: AppColors.black,
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Button(
                            onPressed: () {},
                            icon: Icon(
                              Icons.question_answer,
                              color: Colors.white,
                            ),
                            text: 'Ask a question',
                            fontSize: 12,
                            color: AppColors.black,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Button(
                      onPressed: () {},
                      text: 'Search',
                      icon: Icon(Icons.search, color: Colors.white),
                      fontSize: 16,
                      color: AppColors.black,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Img(
                  src:
                      "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return FeedCard(post: post);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
