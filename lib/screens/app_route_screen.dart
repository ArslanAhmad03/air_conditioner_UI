import 'dart:ui';

import 'package:air_conditioner_ui/screens/cloud_screen.dart';
import 'package:air_conditioner_ui/screens/device_screen.dart';
import 'package:air_conditioner_ui/screens/profile_screen.dart';
import 'package:air_conditioner_ui/screens/setting_screen.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppRouteScreen extends StatefulWidget {
  const AppRouteScreen({super.key});

  @override
  State<AppRouteScreen> createState() => _AppRouteScreenState();
}

class _AppRouteScreenState extends State<AppRouteScreen> {
  int _selectedIndex = 0;

  final List screens = [
    DeviceScreen(),
    CloudScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  final List<String> _icons = [
    'assets/svg/home.svg',
    'assets/svg/cloud.svg',
    'assets/svg/setting.svg',
    'assets/svg/profile-circle.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(16),
              border: Border(
                top: BorderSide(color: Colors.grey.withAlpha(32), width: 1),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (index) {
                bool isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.primaryColor.withOpacity(0.0)
                          : Colors.transparent,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.3),
                                blurRadius: 14,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: SvgPicture.asset(
                      _icons[index],
                      fit: BoxFit.contain,
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.grey.withAlpha(32),
                      height: 24,
                      width: 24,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
