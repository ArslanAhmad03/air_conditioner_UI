import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialBox(
          onTap: () {},
          color: Color(0xFF1877F2),
          iconPath: 'assets/svg/facebook.svg',
        ),
        _socialBox(
          onTap: () {},
          color: Color(0xFFFF1DA1F2),
          iconPath: 'assets/svg/twitter.svg',
        ),
        _socialBox(
          onTap: () {},
          color: Color(0xFFFF2867B2),
          iconPath: 'assets/svg/linkedin.svg',
        ),
        _socialBox(
          onTap: () {},
          color: Color(0xFFFFFFFF),
          iconPath: 'assets/svg/google.svg',
        ),
      ],
    );
  }

  Widget _socialBox({
    required VoidCallback onTap,
    required Color color,
    required String iconPath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: SvgPicture.asset(iconPath, fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
