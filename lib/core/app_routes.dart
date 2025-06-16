import 'package:developer_look/screens/feed/feed_screen.dart';
import 'package:developer_look/screens/share_screen.dart';
import 'package:developer_look/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRouters {
  static const String splash = '/splash';
  static const String feed = '/feed';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String share = '/share';

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