import 'dart:convert';

import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class JuzDetailController extends GetxController {
  final String baseURL = 'https://api.quran.com/api/v4';
  int surahCounter = 0;

  Future<List<Ayah>> getJuzAyah(int juzNumber) async {
    List<dynamic> responseData;

    Uri url = Uri.parse(
        '$baseURL/verses/by_juz/$juzNumber?language=en&fields=text_uthmani,chapter_id&translations=131&per_page=1000');

    var response = await http.get(url);

    response.statusCode == 200
        ? responseData = json.decode(response.body)['verses']
        : throw Exception(
            'Somthing went wrong while fetching Ayah by Juz data');

    List<Ayah> allJuzAyah =
        responseData.map((ayah) => Ayah.fromJson(ayah)).toList();

    return allJuzAyah;
  }
}
