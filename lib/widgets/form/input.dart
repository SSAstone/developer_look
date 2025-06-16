import 'package:developer_look/core/app_colors.dart';
import 'package:developer_look/core/app_pop.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? labelText;
  final String? placeholderText;
  final TextEditingController? controller;
  final bool? require;
  final bool? textarea;
  final dynamic Function(String?)? validator;
  final dynamic Function(String?)? onChanged;
  final dynamic defaultValue;
  final TextInputType? keyboardType;
  final InputStyle style;
  final int? maxLines;

  Input({
    super.key,
    this.labelText,
    this.placeholderText,
    this.textarea,
    this.controller,
    this.require = false,
    this.defaultValue,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.style = const InputStyle(),
    this.maxLines,
  }) {
    if (defaultValue != null) {
      controller?.text = defaultValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onChanged: (value) => onChanged?.call(value),
      style: const TextStyle(fontSize: 16, color: AppColors.textBlack),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        constraints: style.constraints,
        hintText: placeholderText ?? (labelText != null ? 'Enter $labelText' : null ),
        contentPadding: textarea == true ? const EdgeInsets.all(10) : const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText ?? null,
        floatingLabelStyle: TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          backgroundColor: style.color ?? AppColors.white,
        ),
        filled: true,
        fillColor: style.color ?? AppColors.white,
        labelStyle: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:BorderSide(
                  color:  AppColors.grey,
                  width: 1,
                )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(
                  color: AppColors.darkColor,
                  width: 2,
                )
        ),
      ),
      validator: (value) {
        if (require! && (value == null || value.isEmpty)) {
          AppPop.showError('Please enter $labelText');
          // Get.snackbar('Error', 'Please enter $labelText');
          return null;
        }
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
    );
  }
}

class InputStyle {
  final Color? border;
  final Color? color;
  final Color? focusBorder;
  final bool focusNone;
  final BoxConstraints? constraints;

  const InputStyle({
    this.border,
    this.color,
    this.focusBorder = AppColors.black,
    this.focusNone = true,
    this.constraints,
  });
}
