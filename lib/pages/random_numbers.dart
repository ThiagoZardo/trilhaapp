// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    changeData();
  }

  void changeData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      randomNumber = storage.getInt(KEY_RANDOM_NUMBER);
      qtdClicks = storage.getInt(KEY_QTD_CLICKS);
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
            storage.setInt(KEY_RANDOM_NUMBER, randomNumber!);
            storage.setInt(KEY_QTD_CLICKS, qtdClicks!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}