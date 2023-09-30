// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _complete = false;

  Tarefa(this._description, this._complete);

  String get id => _id;
  String get description => _description;
  bool get complete => _complete;

  set description(String description) {
    _description = description;
  }

  set complete(bool complete) {
    _complete = complete;
  }
}