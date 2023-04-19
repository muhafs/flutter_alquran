// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SurahDetailController extends GetxController {
  final String baseURL = 'https://api.quran.com/api/v4';

  Future<List<Ayah>> getSurahDetail(int surahNumber) async {
    Uri url = Uri.parse(
        '$baseURL/verses/by_chapter/$surahNumber?language=en&fields=text_uthmani,chapter_id&translations=131&per_page=1000');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['verses'];

      List<Ayah> surah = data.map((ayah) => Ayah.fromJson(ayah)).toList();

      return surah;
    } else {
      throw Exception('Somthing went wrong while fetching specific surah data');
    }
  }
}
