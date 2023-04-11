import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/constants/colors.dart';
import 'package:flutter_alquran/app/constants/textstyles.dart';
import 'package:flutter_alquran/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
        color: kColorBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Al Quran App',
                    style: kTextStylePoppins.copyWith(
                      fontSize: 28,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Learn Quran and\nRecite once everyday',
                    style: kTextStylePoppins.copyWith(
                      color: kTextColorGray,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.only(bottom: 20),
              child: Lottie.asset('assets/lotties/transparent_couple.json'),
            ),
            SizedBox(
              width: 185,
              height: 60,
              child: TextButton(
                onPressed: () => Get.offNamed(Routes.home),
                style: TextButton.styleFrom(
                  backgroundColor: kColorButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: kTextStylePoppins.copyWith(
                    color: kColorPrimary,
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
