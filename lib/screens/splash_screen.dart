import 'dart:async';

import 'package:developer_look/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(AppRouters.feed);
    });

    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/developerlook_logo.jpeg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          
          ),
        ),
      ),
    );
  }
}
