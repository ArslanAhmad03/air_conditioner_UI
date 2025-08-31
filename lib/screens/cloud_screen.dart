import 'package:air_conditioner_ui/data/dummy_data.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CloudScreen extends StatefulWidget {
  const CloudScreen({super.key});

  @override
  State<CloudScreen> createState() => _CloudScreenState();
}

class _CloudScreenState extends State<CloudScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),

                // Welcome text
                CustomText(
                  text: 'Welcome, Dannie!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/location.svg',
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                    SizedBox(width: 12),
                    CustomText(
                      text: 'Hanoi, Vietnam',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(height: h * 0.08),

                // Logo & Temperature
                Row(
                  children: [
                    SizedBox(
                      height: h * 0.2,
                      width: w * 0.54,
                      child: SvgPicture.asset(
                        'assets/svg/cloud_image.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '29°C',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                'assets/svg/drop.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 4),
                            CustomText(
                              text: '50 %',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: h * 0.06),

                SizedBox(
                  height: h * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //
                              CustomText(
                                text:
                                    "${days[index]["title"]}, ${days[index]["date"]} ${days[index]["month"]}",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                              ),

                              SizedBox(height: 8),

                              //
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                margin: EdgeInsets.symmetric(
                                  vertical: isSelected ? 8 : 50,
                                ),
                                width: w * 0.28,
                                height: h * 0.16,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : const Color.fromARGB(120, 160, 23, 96),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.withAlpha(64),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "9.00 am",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: isSelected
                                                ? AppColors.whiteColor
                                                : Colors.grey,
                                          ),
                                    ),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: SvgPicture.asset(
                                        'assets/svg/cloud.svg',
                                        color: isSelected
                                            ? AppColors.whiteColor
                                            : Colors.grey,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    CustomText(
                                      text: "29 C",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: isSelected
                                                ? AppColors.whiteColor
                                                : Colors.grey,
                                          ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
