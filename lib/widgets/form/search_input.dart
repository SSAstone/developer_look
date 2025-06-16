import 'package:developer_look/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';


class SearchInput extends StatelessWidget {
  final String labelText;
  final List? items;
  final String? placeholderText;
  final String? initialValue;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? defaultValue;
  final SelectStyle style;
  final bool require;
  final String? Function(String?)? validator;

  const SearchInput({
    super.key,
    this.require = false,
    this.placeholderText,
    this.initialValue,
    this.validator,
    required this.labelText,
    this.items,
    required this.controller,
    this.onChanged,
    this.defaultValue,
    this.style = const SelectStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      initialList: items,
      controller: controller,
      label: labelText,
      decoration: InputDecoration(
        constraints: style.constraints,
        hintText: placeholderText ?? 'Enter $labelText',
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        labelText: labelText,
        suffixIcon: const Icon(Icons.arrow_drop_down_sharp, color: AppColors.darkColor),
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
          borderSide: style.border != null
              ? BorderSide(
                  color: style.border ?? AppColors.darkColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: style.focusNone
              ? BorderSide(
                  color: style.focusBorder,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),      
    );
  }
}

class SelectStyle {
  final Color? border;
  final Color focusBorder;
  final bool focusNone;
  final Color? color;
  final BoxConstraints? constraints;

  const SelectStyle({
    this.border,
    this.focusBorder = AppColors.black,
    this.focusNone = true,
    this.color,
    this.constraints
  });
}
