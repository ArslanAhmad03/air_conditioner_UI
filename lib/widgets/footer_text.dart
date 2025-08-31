import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String text;
  final String actiontext;
  final VoidCallback onTap;
  const FooterText({
    super.key,
    required this.text,
    required this.actiontext,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: CustomText(
              text: actiontext,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
