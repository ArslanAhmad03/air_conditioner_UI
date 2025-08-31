import 'package:air_conditioner_ui/screens/add_device.dart';
import 'package:air_conditioner_ui/utils/app_button.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:air_conditioner_ui/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.01),
              //
              CustomText(
                text: 'Welcome, Dannie!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: h * 0.05),

              // logo image
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: h * 0.1,
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                    fit: BoxFit.contain,
                    height: h * 0.1,
                  ),
                ),
              ),

              6.toHeight,

              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Ciao',
                  style: Theme.of(context).textTheme.headlineSmall,
                  letterSpacing: 20,
                ),
              ),

              SizedBox(height: h * 0.1),

              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Add Device',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              SizedBox(height: h * 0.06),

              AppButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDevice()),
                  );
                },
                title: '+',
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
