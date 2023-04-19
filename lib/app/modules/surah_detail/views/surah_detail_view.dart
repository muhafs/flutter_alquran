import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/constants/colors.dart';
import 'package:flutter_alquran/app/constants/textstyles.dart';
import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';

import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../controllers/surah_detail_controller.dart';

class SurahDetailView extends GetView<SurahDetailController> {
  SurahDetailView({Key? key}) : super(key: key);

  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      appBar: AppBar(
        backgroundColor: kColorBg,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: kTextColorGray,
          ),
        ),
        title: Text(
          surah.nameSimple ?? 'something went error',
          style: kTextStylePoppins.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
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
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: kColorSecondary,
                    radius: 10,
                    titlePadding: const EdgeInsets.symmetric(vertical: 16),
                    title: 'Tafsir',
                    titleStyle: kTextStylePoppins.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                    content: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        // surah.tafsir?.id ?? 'Error',
                        'Tafsir will be coming soon',
                        style: kTextStylePoppins.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                  );
                },
                child: Stack(children: [
                  Positioned(
                    bottom: -38,
                    right: -55,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'assets/images/quran.png',
                        width: 324,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text(
                          surah.nameSimple ?? 'something went error',
                          style: kTextStylePoppins.copyWith(
                            fontSize: 26,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          '(${surah.translatedName?.name ?? 'something went error'})',
                          style: kTextStylePoppins.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const Divider(
                          height: 30,
                          endIndent: 30,
                          indent: 30,
                          color: kTextColorLight,
                        ),
                        Text(
                          '${surah.versesCount} Ayah | ${surah.revelationPlace ?? 'error'}',
                          style: kTextStylePoppins.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        surah.id == 1 || surah.id == 9
                            ? const SizedBox()
                            : Container(
                                margin: const EdgeInsets.only(top: 32),
                                child: Image.asset(
                                  'assets/images/bismillah.png',
                                  width: 214,
                                ),
                              ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(height: 32),
          FutureBuilder<List<Ayah>>(
            future: controller.getSurahDetail(surah.id!),
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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Ayah? ayah = snapshot.data?[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: kColorSecondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/icon_ayah.png',
                                  width: 27,
                                ),
                                Text(
                                  '${ayah?.verseNumber ?? '0'}',
                                  style: kTextStylePoppins.copyWith(
                                    fontSize: 10,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.play_arrow_outlined,
                                    color: kTextColorPurple,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.bookmark_border_rounded,
                                    color: kTextColorPurple,
                                    size: 24,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          ayah?.textUthmani ?? 'error',
                          style: kTextStyleAmiri.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                            height: 2.5,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Divider(
                        color: kTextColorGray,
                        height: 32,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: Text(
                          parse(ayah?.translations?[0].text)
                                  .documentElement
                                  ?.text ??
                              'Something went error',
                          style: kTextStylePoppins.copyWith(
                            color: kTextColorGray,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
