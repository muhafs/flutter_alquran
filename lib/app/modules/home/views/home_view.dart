import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/data/models/surah_model.dart';
import 'package:flutter_alquran/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D2233),
        title: Text(
          'Quran App',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF10121A),
        child: FutureBuilder<List<Surah>>(
          future: controller.getAllSurah(),
          builder: (context, snapshot) {
            //? Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //? Error
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data Available'),
              );
            }

            //? Loaded
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 5 / 4,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshot.data![index];

                return GestureDetector(
                  onTap: () =>
                      Get.toNamed(Routes.surahDetail, arguments: surah),
                  child: Card(
                    color: const Color(0xFF1D2233),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_ayah.png',
                                      width: 36,
                                    ),
                                    Text(
                                      '${surah.number}',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  surah.name?.short ?? 'Error',
                                  style: GoogleFonts.amiri(
                                    color: const Color(0xFFA44AFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              surah.name?.transliteration?.en ?? 'error',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${surah.numberOfVerses} Ayah',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFA19CC5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                surah.revelation?.id ?? 'error',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFA19CC5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
