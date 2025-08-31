import 'package:flutter/material.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';

final _baseTextStyle = const TextStyle(
  fontFamily: 'Poppins',
  color: AppColors.whiteColor,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double letterSpacing;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    final finalStyle = _baseTextStyle.merge(style);

    return Text(
      text,
      style: finalStyle.copyWith(letterSpacing: letterSpacing),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
