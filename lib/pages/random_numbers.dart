// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int? randomNumber = 0;
  int? qtdClicks = 0;
  final KEY_RANDOM_NUMBER = 'random_number';
  final KEY_QTD_CLICKS = 'qtd_clicks';
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    changeData();
  }

  void changeData() async {
    setState(() async {
      randomNumber = await storage.getRegistrionDataRandomNumber();
      qtdClicks = await storage.getRegistrionDataQtdClicks();
    });
    debugPrint(randomNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de números aleatórios'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(randomNumber.toString(),
            style: const TextStyle(fontSize: 22)),
            Text(qtdClicks == null ? '' : qtdClicks.toString(),
            style: const TextStyle(fontSize: 22))
          ],),
        ),
        floatingActionButton: FloatingActionButton(

          
          onPressed: () async {
            var random = Random();
            setState(() {
              randomNumber = random.nextInt(1000);
              qtdClicks = qtdClicks! + 1;
            });
            storage.setRegistrionDataRandomNumber(randomNumber!);
            storage.setRegistrionDataQtdClicks(qtdClicks!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}