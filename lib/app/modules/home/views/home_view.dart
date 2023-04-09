import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/constants/colors.dart';
import 'package:flutter_alquran/app/constants/textstyles.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';
import 'package:flutter_alquran/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Text(
          'Quran App',
          style: kTextStylePoppins.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: kColorBg,
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
                    color: kColorPrimary,
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
                                      style: kTextStylePoppins.copyWith(
                                        fontSize: 12,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  surah.name?.short ?? 'Error',
                                  style: kTextStyleAmiri.copyWith(
                                    color: kTextColorPurple,
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              surah.name?.transliteration?.en ?? 'error',
                              style: kTextStylePoppins.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${surah.numberOfVerses} Ayah',
                                style: kTextStylePoppins.copyWith(
                                  color: kTextColorGray,
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                surah.revelation?.id ?? 'error',
                                style: kTextStylePoppins.copyWith(
                                  color: kTextColorGray,
                                  fontSize: 12,
                                  fontWeight: medium,
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
