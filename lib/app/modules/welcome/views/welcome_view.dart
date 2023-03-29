import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        color: const Color(0xFFB0DAFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quran Ibn Hafs',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aplikasi ini insyallah menjadi amal jariyah al hafsin makki jazuli',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
            TextButton(
              onPressed: () => Get.offNamed(Routes.HOME),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFEB455F),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
