// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_alquran/app/data/models/juz.dart';
import 'package:flutter_alquran/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final box = GetStorage();

  Future<List<Surah>> getAllSurah() async {
    List<dynamic> responseData;

    if (box.read('list_surah') != null) {
      responseData = json.decode(box.read('list_surah'));

      print('data is fetched from storage');
    } else {
      Uri url = Uri.parse('https://al-quraan-api.vercel.app/surah');

      var response = await http.get(url);

      response.statusCode == 200
          ? responseData = json.decode(response.body)['data']
          : throw Exception(
              'Somthing went wrong while fetching all surah data');

      box.write('list_surah', json.encode(responseData));
      print('data is fetched from api');
    }

    List<Surah> allSurah =
        responseData.map((surah) => Surah.fromJson(surah)).toList();

    return allSurah;
  }

  Future<List<Juz>> getAllJuz() async {
    List<dynamic> responseData;

    if (box.read('list_juz') != null) {
      responseData = json.decode(box.read('list_juz'));

      print('data is fetched from storage');
    } else {
      List<Map<String, dynamic>> responseDataList = [];

      for (int i = 1; i <= 30; i++) {
        Uri url = Uri.parse('https://al-quraan-api.vercel.app/juz/$i');

        var response = await http.get(url);

        response.statusCode == 200
            ? responseDataList.add(json.decode(response.body)['data'])
            : throw Exception('Somthing went wrong while fetching Juz data');
      }

      responseData = responseDataList;

      box.write('list_juz', json.encode(responseData));
      print('data is fetched from api');
    }

    List<Juz> allJuz = responseData.map((juz) => Juz.fromJson(juz)).toList();

    return allJuz;
  }
}
