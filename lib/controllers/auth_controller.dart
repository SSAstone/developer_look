import 'package:developer_look/core/app_pop.dart';
import 'package:developer_look/core/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final Rx<TextEditingController> confirmPassword = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: email.value.text.trim(),
        password: password.value.text.trim(),
      );

      isLoading.value = false;
      AppPop.showSuccess('Login successful!');
      Get.offAllNamed(AppRouters.feed);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        AppPop.showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppPop.showError('Wrong password provided.');
      } else {
        AppPop.showError(e.message ?? 'Login failed');
      }
    }
  }

  Future<void> signUp() async {
    if (password.value.text != confirmPassword.value.text) {
      AppPop.showError('Passwords do not match');
      return;
    }

    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email.value.text.trim(),
        password: password.value.text.trim(),
      );

      isLoading.value = false;
      AppPop.showSuccess('Account created successfully!');
      Get.offAllNamed(AppRouters.login);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        AppPop.showError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppPop.showError('An account already exists for that email.');
      } else {
        AppPop.showError(e.message ?? 'Sign-up failed');
      }
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(AppRouters.login);
    AppPop.showError('You have been logged out');
  }
}
