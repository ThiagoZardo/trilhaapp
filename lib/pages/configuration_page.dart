// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  AppStorageService storage = AppStorageService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController  = TextEditingController();

  String? userName;
  double? height;
  bool pushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    super.initState();
    changeData();
  }

  changeData() async {
    setState(() async {
      userNameController.text = await storage.getRegistrionDataUserName();
      heightController.text = (await storage.getRegistrionDataUserHeight()).toString();
      pushNotification = await storage.getRegistrionDataPushNotification();
      darkTheme = await storage.getRegistrionDataDarkTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Nome Usuário'
                  ),
                  controller: userNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Altura',
                  ),
                  controller: heightController,
                ),
              ),
              SwitchListTile(
                title: const Text('Receber notificações'),
                onChanged: (bool value) {
                  setState(() {
                    pushNotification = !pushNotification;
                  });
                },
                value: pushNotification,
              ),
              SwitchListTile(
                title: const Text('Tema escuro'),
                onChanged: (bool value) {
                  setState(() {
                    darkTheme = !darkTheme;
                  });
                },
                value: darkTheme,
              ),
              TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                    storage.setRegistrionDataUserName(userNameController.text);
                    storage.setRegistrionDataPushNotification(pushNotification);
                    storage.setRegistrionDataDarkTheme(darkTheme);
                  try {
                    storage.setRegistrionDataHeight(double.parse(heightController.text));
                  } catch (error) {
                    debugPrint('veio pra cá');
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
                              child: const Text('Ok'),
                            )
                          ],
                        );
                      }
                    );
                    return;
                  }
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