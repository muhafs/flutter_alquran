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
        color: const Color(0xFF1D2233),
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
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Learn Quran and\nRecite once everyday',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFA19CC5),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
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
                onPressed: () => Get.offNamed(Routes.HOME),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFF9B091),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF091945),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
