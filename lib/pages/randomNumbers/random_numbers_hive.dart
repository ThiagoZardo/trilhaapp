import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RandomNumbersHivePage extends StatefulWidget {
  const RandomNumbersHivePage({super.key});

  @override
  State<RandomNumbersHivePage> createState() => _RandomNumbersHivePageState();
}

class _RandomNumbersHivePageState extends State<RandomNumbersHivePage> {

  int? randomNumber = 0;
  int? qtdClicks = 0;
  late Box boxRandomNumbers;

  @override
  void initState() {
    super.initState();
    changeData();
  }

  void changeData() async {
    if (Hive.isBoxOpen('box_random_numers')) {
      boxRandomNumbers = Hive.box('box_random_numers');
    } else {
      boxRandomNumbers = await Hive.openBox('box_random_numers');
    }
    randomNumber = await boxRandomNumbers.get('randomNumber') ?? 0;
    qtdClicks = await boxRandomNumbers.get('qtdClicks') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de números aleatórios Hive'),
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
            boxRandomNumbers.put('randomNumber', randomNumber!);
            boxRandomNumbers.put('qtdClicks', qtdClicks!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}