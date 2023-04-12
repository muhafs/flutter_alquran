import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/juz_detail_controller.dart';

class JuzDetailView extends GetView<JuzDetailController> {
  const JuzDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JuzDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JuzDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
