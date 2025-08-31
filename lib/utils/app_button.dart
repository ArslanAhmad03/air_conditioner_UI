import 'package:flutter/material.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final TextStyle? textStyle;
  final bool loading;

  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backgroundColor,
    this.height,
    this.width,
    this.borderRadius = 8,
    this.textStyle,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            return backgroundColor ?? AppColors.primaryColor;
          }),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: loading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                title,
                style:
                    textStyle ??
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
      ),
    );
  }
}
