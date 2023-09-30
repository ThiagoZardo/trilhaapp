import 'package:flutter/material.dart';

class TimeExperience {
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
}
