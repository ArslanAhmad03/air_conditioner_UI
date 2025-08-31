import 'package:air_conditioner_ui/data/dummy_data.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/back_button.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:air_conditioner_ui/widgets/circle_icon.dart';
import 'package:air_conditioner_ui/widgets/custom_loading_painter.dart';
import 'package:air_conditioner_ui/widgets/device_bottom_card.dart';
import 'package:flutter/material.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  late List<double> _sliderValues;

  double arc = 1;

  @override
  void initState() {
    super.initState();
    _sliderValues = addDeviceData
        .map((data) => double.tryParse(data['value'] ?? '1') ?? 1)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    double currentTotal = _sliderValues.reduce((a, b) => a + b);
    double progress =
        currentTotal / (addDeviceData.length * 10); // 4 sliders * 10

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),

                // Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonBox(),
                    CustomText(
                      text: 'GL V10WIN',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 26),
                  ],
                ),

                SizedBox(height: h * 0.08),

                Align(
                  alignment: Alignment.center,
                  child: CustomPaint(
                    painter: LoadingArcPainter(progress: progress),
                    child: Container(
                      height: w * 0.40,
                      width: w * 0.40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          height: w * 0.28,
                          width: w * 0.28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backgroundColor,
                            border: Border.all(
                              color: AppColors.backgroundColor,
                              width: 3,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.backgroundColor,
                                const Color.fromARGB(100, 38, 41, 46),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '29°C',
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.08),

                //
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addDeviceData.length,
                  itemBuilder: (context, index) {
                    final data = addDeviceData[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 52,
                          child: CustomText(
                            text: data['title']!,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),

                        CircleIcon(imageIcon: data['iconPath']!),

                        Slider.adaptive(
                          value: _sliderValues[index],
                          min: 1,
                          max: 10,
                          inactiveColor: Colors.grey.withAlpha(128),
                          onChanged: (val) {
                            setState(() {
                              _sliderValues[index] = val;
                              arc = val;
                            });
                          },
                          thumbColor: Colors.black,
                        ),
                      ],
                    );
                  },
                ),

                //
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DeviceBottomCard(),
    );
  }
}
