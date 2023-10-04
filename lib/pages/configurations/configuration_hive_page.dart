// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/model/configuration_model.dart';
import 'package:trilhaapp/repositories/configurations_repositoriy.dart';

class ConfigurationHivePage extends StatefulWidget {
  const ConfigurationHivePage({super.key});

  @override
  State<ConfigurationHivePage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationHivePage> {
  late ConfigurationsRepository configurationsRepository;
  ConfigurationsModel configurationsModel = ConfigurationsModel.empy();

  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController  = TextEditingController();

  late Box boxRandomNumbers;

  @override
  void initState() {
    super.initState();
    changeData();
  }

  changeData() async {
    configurationsRepository = await ConfigurationsRepository.load();
    configurationsModel = configurationsRepository.getData();

    userNameController.text = configurationsModel.userName;
    heightController.text = configurationsModel.height.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Configurações Hive')),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Nome Usuário'),
                  controller: userNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Altura'),
                  controller: heightController,
                ),
              ),
              SwitchListTile(
                title: const Text('Receber notificações'),
                onChanged: (bool value) {
                  setState(() {
                    configurationsModel.pushNotification = value;
                  });
                },
                value: configurationsModel.pushNotification,
              ),
              SwitchListTile(
                title: const Text('Tema escuro'),
                value: configurationsModel.darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    configurationsModel.darkTheme = value;
                  });
                }),
              TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configurationsModel.height = double.parse(heightController.text);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('meu App'),
                          content: const Text('insira dados válidos'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'))
                          ],
                        );
                      });
                    return;
                  }
                  configurationsModel.userName = userNameController.text;
                  configurationsRepository.save(configurationsModel);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: const Text('Salvar')
              )
            ],
          ),
        ),
      ));
  }
}