import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final Icon? icon;
  const Button({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xff4a4a4a),
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        elevation: elevation ?? 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
            ),
            textAlign: TextAlign.center,
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon!.icon, color: textColor ?? Colors.white),
          ],
        ],
      ),
    );
  }
}
