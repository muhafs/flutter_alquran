// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_alquran/app/data/models/surah_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SurahDetailController extends GetxController {
  Future<SurahDetail> getSurahDetail(int surahNumber) async {
    Uri url = Uri.parse('https://al-quraan-api.vercel.app/surah/$surahNumber');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];

      SurahDetail surah = SurahDetail.fromJson(data);

      return surah;
    } else {
      throw Exception('Somthing went wrong while fetching specific surah data');
    }
  }
}
