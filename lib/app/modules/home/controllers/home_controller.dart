// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:flutter_alquran/app/data/models/juz.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final _box = GetStorage();
  final String baseURL = 'https://api.quran.com/api/v4';

  late List<dynamic> _responseSurahData;
  late List<dynamic> _responseJuzData;

  late List<Surah> allSurahData;

  Future<List<Surah>> getAllSurah() async {
    if (_box.read('list_surah') != null) {
      _responseSurahData = json.decode(_box.read('list_surah'));

      print('surah data is fetched from storage');
    } else {
      Uri url = Uri.parse('$baseURL/chapters?language=en');

      var response = await http.get(url);

      response.statusCode == 200
          ? _responseSurahData = json.decode(response.body)['chapters']
          : throw Exception(
              'Somthing went wrong while fetching all surah data');

      _box.write('list_surah', json.encode(_responseSurahData));
      print('surah data is fetched from api');
    }

    List<Surah> allSurah =
        _responseSurahData.map((surah) => Surah.fromJson(surah)).toList();

    allSurahData = allSurah;

    return allSurah;
  }

  Future<List<Juz>> getAllJuz() async {
    if (_box.read('list_juz') != null) {
      _responseJuzData = json.decode(_box.read('list_juz'));

      print('juz data is fetched from storage');
    } else {
      Uri url = Uri.parse('$baseURL/juzs');

      var response = await http.get(url);

      response.statusCode == 200
          ? _responseJuzData = json.decode(response.body)['juzs']
          : throw Exception('Somthing went wrong while fetching Juz data');

      _box.write('list_juz', json.encode(_responseJuzData));
      print('juz data is fetched from api');
    }

    List<Juz> allJuz =
        _responseJuzData.map((juz) => Juz.fromJson(juz)).toList();

    return allJuz;
  }
}
