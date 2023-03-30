import 'package:flutter/material.dart';
import 'package:flutter_alquran/app/data/models/surah_detail_model.dart'
    as detail;
import 'package:flutter_alquran/app/data/models/surah_model.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/surah_detail_controller.dart';

class SurahDetailView extends GetView<SurahDetailController> {
  SurahDetailView({Key? key}) : super(key: key);

  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${surah.name.transliteration.en}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    surah.name.transliteration.en,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(${surah.name.translation.en})',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${surah.numberOfVerses} Ayah | ${surah.revelation.id}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder<detail.SurahDetail>(
            future: controller.getSurahDetail(surah.number),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No Data Available'),
                );
              }

              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surah.numberOfVerses,
                  itemBuilder: (context, index) {
                    detail.Verse? ayah = snapshot.data?.verses[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text('${index + 1}'),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.bookmark_border_outlined),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.play_arrow),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            ayah!.text.arab,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            ayah.translation.en,
                            style: GoogleFonts.poppins(
                              color: Colors.black45,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Text(
                            ayah.translation.id,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
