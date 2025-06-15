
import 'package:developer_look/routes/app_routes.dart';
import 'package:developer_look/screens/feed/feed_screen.dart';
import 'package:developer_look/screens/share_screen.dart';
import 'package:developer_look/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRouters.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRouters.feed,
      page: () => FeedScreen(),
    ),
    GetPage(
      name: AppRouters.share,
      page: () => ShareScreen(),
    ),
  ];
}