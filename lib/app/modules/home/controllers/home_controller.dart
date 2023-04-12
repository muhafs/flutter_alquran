// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_alquran/app/data/models/juz.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://al-quraan-api.vercel.app/surah');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];

      List<Surah> allSurah =
          data.map((surah) => Surah.fromJson(surah)).toList();

      return allSurah;
    } else {
      throw Exception(
          'Somthing went wrong while fetching list of all surah data');
    }
  }

  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];

    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse('https://al-quraan-api.vercel.app/juz/$i');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];

        Juz juz = Juz.fromJson(data);

        allJuz.add(juz);
      } else {
        throw Exception('Somthing went wrong while fetching Juz data');
      }
    }

    return allJuz;
  }
}
