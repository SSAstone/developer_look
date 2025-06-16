import 'package:developer_look/core/app_colors.dart';
import 'package:developer_look/core/app_pop.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;

  final String? placeholderText;
  final bool? require;
  final dynamic Function(String?)? validator;
  final dynamic defaultValue;
  final TextInputType? keyboardType;
  final PasswordStyle style;

  const PasswordInput({
    super.key,
    required this.controller,
    this.labelText,
    this.placeholderText,
    this.require = true,
    this.validator,
    this.defaultValue,
    this.keyboardType,
    this.style = const PasswordStyle(),
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.placeholderText ?? 'Enter ${widget.labelText}',
        labelText: widget.labelText,
        fillColor: widget.style.color ?? AppColors.white,
        filled: true,
        floatingLabelStyle: const TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          backgroundColor: AppColors.white,
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: widget.style.border != null
              ? BorderSide(
                  color: widget.style.border ?? AppColors.black,
                  width: 1,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              (widget.style.focusBorder != null && widget.style.focusNone)
                  ? BorderSide(
                      color: widget.style.focusBorder ?? AppColors.black,
                      width: 2,
                    )
                  : BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.remove_red_eye : Icons.visibility_off,
          ),
          onPressed: () {
            // homeController.obscureText.value =
            //     !homeController.obscureText.value;
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        suffixIconColor: AppColors.black,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        focusColor: AppColors.black,
      ),
      obscureText: obscureText,
      validator: (value) {
        if (widget.require == true) {
          if (value == null || value.isEmpty) {
            AppPop.show('Please enter ${widget.labelText}');
            // return 'Please enter ${widget.labelText}';
          }
        }
        return widget.validator?.call(value);
      },
    );
  }
}

class PasswordStyle {
  final Color? border;
  final Color? focusBorder;
  final Color? color;
  final bool focusNone;

  const PasswordStyle({
    this.border,
    this.focusBorder = AppColors.black,
    this.focusNone = true,
    this.color,
  });
}
