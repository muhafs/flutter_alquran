import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/constants/colors.dart';
import 'package:flutter_alquran/app/constants/textstyles.dart';
import 'package:flutter_alquran/app/data/models/juz.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';
import 'package:flutter_alquran/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      appBar: AppBar(
        backgroundColor: kColorBg,
        elevation: 0,
        title: Text(
          'Quran App',
          style: kTextStylePoppins.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: IconButton(
              onPressed: () => Get.toNamed(Routes.search),
              icon: const Icon(
                Icons.search,
                color: kTextColorGray,
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Home Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assalamualaikum',
                    style: kTextStylePoppins.copyWith(
                      color: kTextColorGray,
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Muhamad Hafs',
                    style: kTextStylePoppins.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
            //! Last Read Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: 326,
                height: 131,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFDF98FA),
                      Color(0xFF9055FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -29,
                          right: -33,
                          child: Opacity(
                            opacity: 0.8,
                            child: Image.asset(
                              'assets/images/quran.png',
                              width: 206,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 19,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.menu_book_rounded,
                                    size: 20,
                                    color: kTextColorLight,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Last Read',
                                    style: kTextStylePoppins.copyWith(
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Al-Fatiha',
                                style: kTextStylePoppins.copyWith(
                                  fontSize: 18,
                                  fontWeight: semibold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ayah No. 1',
                                style: kTextStylePoppins,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //! Tab Bar Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TabBar(
                indicatorColor: kTextColorPurple,
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : Colors.transparent;
                  },
                ),
                labelStyle: kTextStylePoppins.copyWith(
                  fontWeight: bold,
                ),
                unselectedLabelColor: kTextColorGray,
                tabs: const [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Juz',
                  ),
                  Tab(
                    text: 'Bookmark',
                  ),
                ],
              ),
            ),
            //! Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<List<Surah>>(
                    future: controller.getAllSurah(),
                    builder: (context, snapshot) {
                      //? Loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kTextColorPurple,
                          ),
                        );
                      }

                      //? Error
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No Data Available'),
                        );
                      }

                      //? Loaded
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Surah surah = snapshot.data![index];

                          return ListTile(
                            onTap: () => Get.toNamed(
                              Routes.surahDetail,
                              arguments: surah,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            leading: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/icon_ayah.png',
                                  width: 36,
                                ),
                                Text(
                                  '${surah.id}',
                                  style: kTextStylePoppins.copyWith(
                                    fontSize: 12,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              surah.nameSimple ?? 'error',
                              style: kTextStylePoppins.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            subtitle: Text(
                              '${surah.revelationPlace} • ${surah.versesCount} Ayah',
                              style: kTextStylePoppins.copyWith(
                                color: kTextColorGray,
                                fontSize: 12,
                                fontWeight: medium,
                              ),
                            ),
                            trailing: Text(
                              surah.nameArabic ?? 'Error',
                              style: kTextStyleAmiri.copyWith(
                                color: kTextColorPurple,
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  FutureBuilder<List<Juz>>(
                    future: controller.getAllJuz(),
                    builder: (context, snapshot) {
                      //? Loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kTextColorPurple,
                          ),
                        );
                      }

                      //? Error
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No Data Available'),
                        );
                      }

                      //? Loaded
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Juz juz = snapshot.data![index];

                          List<double> listOfKeys = juz.verseMapping!.keys
                              .map((key) => double.parse(key))
                              .toList();

                          List<Surah> surahInJuz = [];
                          for (var surah in controller.allSurahData) {
                            double surahID = surah.id!.toDouble();
                            if (listOfKeys.contains(surahID)) {
                              surahInJuz.add(surah);
                            }
                          }

                          double juzFirstSurah =
                              double.parse(juz.verseMapping!.keys.first);

                          Surah firstSurahInJuz =
                              controller.allSurahData.firstWhere((surah) {
                            return juzFirstSurah == surah.id!.toDouble();
                          });

                          int juzFirstAyah = int.parse(
                              juz.verseMapping!.values.first.split('-')[0]);

                          return ListTile(
                            onTap: () => Get.toNamed(
                              Routes.juzDetail,
                              arguments: {
                                'juz': juz,
                                'surah': surahInJuz,
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            leading: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/icon_ayah.png',
                                  width: 36,
                                ),
                                Text(
                                  '${juz.id}',
                                  style: kTextStylePoppins.copyWith(
                                    fontSize: 12,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              'Juz ${juz.id ?? 'error'}',
                              style: kTextStylePoppins.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            subtitle: Text(
                              'From Ayah $juzFirstAyah',
                              style: kTextStylePoppins.copyWith(
                                color: kTextColorGray,
                                fontSize: 12,
                                fontWeight: medium,
                              ),
                            ),
                            trailing: Text(
                              firstSurahInJuz.nameArabic ?? 'error',
                              style: kTextStyleAmiri.copyWith(
                                color: kTextColorPurple,
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      'Bookmark',
                      style: kTextStylePoppins.copyWith(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
