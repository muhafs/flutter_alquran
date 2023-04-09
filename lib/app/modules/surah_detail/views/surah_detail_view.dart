import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/constants/colors.dart';
import 'package:flutter_alquran/app/constants/textstyles.dart';
import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:flutter_alquran/app/data/models/surah_detail.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';

import 'package:get/get.dart';

import '../controllers/surah_detail_controller.dart';

class SurahDetailView extends GetView<SurahDetailController> {
  SurahDetailView({Key? key}) : super(key: key);

  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Text(
          surah.name?.transliteration?.en ?? 'something went error',
          style: kTextStylePoppins.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: kColorBg,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: kColorPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    surah.name?.transliteration?.en ?? 'something went error',
                    style: kTextStylePoppins.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '(${surah.name?.translation?.en ?? 'something went error'})',
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
                    '${surah.numberOfVerses} Ayah | ${surah.revelation?.id ?? 'error'}',
                    style: kTextStylePoppins.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<SurahDetail>(
              future: controller.getSurahDetail(surah.number!),
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
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surah.numberOfVerses,
                  itemBuilder: (context, index) {
                    Ayah? ayah = snapshot.data?.verses?[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: kColorPrimary,
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
                                    width: 36,
                                  ),
                                  Text(
                                    '${index + 1}',
                                    style: kTextStylePoppins.copyWith(
                                      fontSize: 12,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark_border_outlined,
                                      color: kTextColorPurple,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      color: kTextColorPurple,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            ayah!.text?.arab ?? 'Something went error',
                            style: kTextStyleAmiri.copyWith(
                              fontSize: 18,
                              fontWeight: bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            ayah.translation?.en ?? 'Something went error',
                            style: kTextStylePoppins.copyWith(
                              color: kTextColorGray,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const Divider(
                          color: kTextColorGray,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Text(
                            ayah.translation?.id ?? 'Something went error',
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
      ),
    );
  }
}
