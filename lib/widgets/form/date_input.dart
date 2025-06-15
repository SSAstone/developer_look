import 'package:developer_look/styles/app_colors.dart';
import 'package:flutter/material.dart';


class DateInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool? border;
  final bool? require;
  final DataStyle style;

  const DateInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.border = false,
    this.require = false,
    this.style = const DataStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: "Enter $labelText",
        labelText: labelText,
        filled: true,
        floatingLabelStyle: TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          backgroundColor: style.color ?? AppColors.white,
        ),
        prefixIcon: const Icon(Icons.date_range),
        fillColor: style.color ?? AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: style.border != null
              ? const BorderSide(
                  color: AppColors.black,
                  width: 1,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: (style.focusBorder != null || style.focusNone == true)
              ? BorderSide(
                  color: style.focusBorder ?? AppColors.black,
                  width: 2,
                )
              : BorderSide.none,
        ),
        focusColor: AppColors.black,
      ),
      onTap: () async {
        DateTime? pickedDate = await pickDate(context);
        if (pickedDate != null) {
          print(pickedDate);
          String formattedDate = pickedDate.toString().substring(0, 10);
          controller.text = formattedDate;
        }
      },
      validator: (value) {
        if (require == true && (value == null || value.isEmpty)) {
          // return 'Please Enter $labelText';
          
          return;
        }
        return null;
      },
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}

class DataStyle {
  final Color? border;
  final Color? focusBorder;
  final Color? color;
  final bool focusNone;


  const DataStyle({
    this.border,
    this.focusBorder = AppColors.black,
    this.focusNone = true,
    this.color = AppColors.white,
  });
}
