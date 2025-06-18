import 'package:developer_look/controllers/auth_controller.dart';
import 'package:developer_look/core/app_routes.dart';
import 'package:developer_look/widgets/common/button.dart';
import 'package:developer_look/widgets/common/img.dart';
import 'package:developer_look/widgets/form/input.dart';
import 'package:developer_look/widgets/form/password_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height * 0.08),
                Img(
                  src: "assets/images/developerlook_logo.jpeg",
                  width: 100,
                  height: 100,
                  borderRadius: BorderRadius.circular(10),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Developer Look',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.04),
                Input(
                  labelText: "Email",
                  controller: controller.email.value,
                  require: true,
                ),
                const SizedBox(height: 12),
                PasswordInput(
                  labelText: "Password",
                  controller: controller.password.value,
                  require: true,
                ),
                const SizedBox(height: 28),
                Button(
                  text: 'Login',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.login();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        controller.email.value.clear();
                        controller.password.value.clear();
                        
                        Get.toNamed(AppRouters.signup);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
