// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/services/app_storage_service.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  AppStorageService storage = AppStorageService();

  var nameController = TextEditingController(text: "");

  var birthDateController = TextEditingController(text: "");
  DateTime? birthDate;

  LevelRepository levelRepository = LevelRepository();
  var levels = [];
  var levelSelect = "";

  LanguagesRepository languagesRepository = LanguagesRepository();
  var languages = [];
  List<String> languagesSelect = [];

  double salaryChosen = 0;

  int timeExperience = 0;

  bool save = false;

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languagesRepository.returnLanguages();
    super.initState();
    dataChange();
  }

  void dataChange() async {

    nameController.text = await storage.getRegistrionDataName();
    birthDateController.text = await storage.getRegistrionDataBirthDate();
    // if (birthDateController.text.isNotEmpty) {
    //   birthDate = DateTime.parse(birthDateController.text);
    // }
    levelSelect = await storage.getRegistrionDataLevel();
    languagesSelect = await storage.getRegistrionDataLanguages();
    timeExperience = await storage.getRegistrionDataTimeExperience();
    salaryChosen = await storage.getRegistrionDataSalaryChosene();

    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItems(int maxQtd) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= maxQtd; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: save
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(text: "Nome:"),
                  TextField(
                    controller: nameController,
                  ),
                  const TextLabel(text: "Data de nascimento:"),
                  TextField(
                    controller: birthDateController,
                    readOnly: true,
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        birthDateController.text = date.toString();
                        birthDate = date;
                      }
                    },
                  ),
                  const TextLabel(text: "Nivel de experiência"),
                  Column(
                    children: levels
                        .map((level) => RadioListTile(
                              dense: true,
                              title: Text(level.toString()),
                              selected: levelSelect == level,
                              value: level.toString(),
                              groupValue: levelSelect,
                              onChanged: (value) {
                                setState(() {
                                  levelSelect = value.toString();
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const TextLabel(text: "Linguagens preferidas"),
                  Column(
                    children: languages
                        .map(
                          (language) => CheckboxListTile(
                            dense: true,
                            title: Text(language.toString()),
                            value: languagesSelect.contains(language),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  languagesSelect.add(language);
                                });
                              } else {
                                setState(() {
                                  languagesSelect.remove(language);
                                });
                              }
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const TextLabel(text: "Tempo de experiência"),
                  DropdownButton(
                      value: timeExperience,
                      isExpanded: true,
                      items: returnItems(50),
                      onChanged: (value) {
                        setState(() {
                          timeExperience = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      text:
                          "Pretenção salarial R\$ ${salaryChosen.round().toStringAsFixed(2)}"),
                  Slider(
                    min: 0,
                    max: 10000,
                    value: salaryChosen,
                    onChanged: (double value) {
                      setState(() {
                        salaryChosen = value;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          save = false;
                        });
                        if (nameController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Nome deve conter mais de 3 caracteres')),
                          );
                          return;
                        }
                        if (birthDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'O campo data de nascimento é obrigatória')),
                          );
                          return;
                        }
                        if (levelSelect.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'O campo nível de experiência é obrigatório')),
                          );
                          return;
                        }
                        if (languagesSelect.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('O campo linguagem é obrigatório')),
                          );
                          return;
                        }
                        if (timeExperience == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'O campo tempo de experiência é obrigatório')),
                          );
                          return;
                        }
                        if (salaryChosen == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'O campo pretenção salarial é obrigatório')),
                          );
                          return;
                        }
                        storage.setRegistrionDataName(nameController.text);
                        storage.setRegistrionDataBirthDate(birthDateController.toString());
                        storage.setRegistrionDataLevel(levelSelect);
                        storage.setRegistrionLanguages(languagesSelect);
                        storage.setRegistrionDataTimeExperience(timeExperience);
                        storage.setRegistrionDataSalaryChosen(salaryChosen);
                        setState(() {
                          save = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () async {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Dados salvos com sucesso')));
                          setState(() {
                            save = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
