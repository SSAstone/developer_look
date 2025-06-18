import 'package:developer_look/controllers/auth_controller.dart';
import 'package:developer_look/models/feed_model.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final AuthController authController = Get.put(AuthController());
  var posts = <FeedModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFeeds();
  }

  void loadFeeds() {
    final jsonData = [
      {
        "user": {
          "name": "John Doe",
          "image": "https://icon-library.com/images/user-icon-png/user-icon-png-17.jpg"
        },
        "time": "1 day ago",
        "rating": 5.0,
        "tags": ["LHR - DEL", "Air India", "Business Class", "July 2023"],
        "description": "Stay tuned for a ​smoother, more convenient experience right at your fingertips ,  a ​smoother, more convenient  a ​smoother, more convenient other, more convenient experience right at your ",
        "likes": 30,
        "comments": 20,
        "images": [
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
        ],
        "commentsList": [
          {
            "user": {
              "name": "Alice Smith",
              "image": "https://icon-library.com/images/user-icon-png/user-icon-png-17.jpg"
            },
            "time": "1 hour ago",
            "votes": 5,
            "comment": "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis"
          },
          
        ]
      },
      {
        "user": {
          "name": "Mark Benson",
          "image": "https://icon-library.com/images/user-icon-png/user-icon-png-17.jpg"
        },
        "time": "2 days ago",
        "rating": 4.8,
        "tags": ["NYC - LAX", "Delta", "Economy", "June 2023"],
        "description": "Stay tuned for a ​smoother, more convenient experience right at your fingertips ,  a ​smoother, more convenient  a ​smoother, more convenient other, more convenient experience right at your ",
        "likes": 15,
        "comments": 8,
        "images": [
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg",
          "https://img.freepik.com/premium-photo/view-tower-through-window-window-view-from-metal-window_916943-361.jpg"
        ],
        "commentsList": [
          {
            "user": {
              "name": "Charlie Brown",
              "image": "https://icon-library.com/images/user-icon-png/user-icon-png-17.jpg"
            },
            "time": "2 hours ago",
            "votes": 4,
            "comment": "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis"
          }
        ]
      }
    ];

    posts.value = jsonData.map((e) => FeedModel.fromJson(e)).toList();
  }
}