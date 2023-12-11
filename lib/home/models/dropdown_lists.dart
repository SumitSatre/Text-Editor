import 'dart:ui';

import 'package:flutter/material.dart';

List<String> fontFamilies = [
  "serif",
  "sans-serif",
  "monospace",
  "Raleway",
  "Quicksand",
  "Poppins"
];

List<String> fontSizeList = [
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31",
  "32",
  "33",
  "34",
  "35"
];

List<String> colorNamesList = [
'Amber',
'Black',
'Blue',
'BlueAccent',
'Brown',
'Cyan',
'DeepOrange',
'DeepPurple',
'Green',
'Grey',
'Indigo',
'LightBlue',
'LightGreen',
'lime',
'limeAccent',
'orange',
'orangeAccent',
'pink',
'pinkAccent',
'purple',
'purpleAccent',
'Red',
'RedAccent',
'Teal',
'TealAccent',
'Yellow',
'YellowAccent',
'White',
];

Color getColorByName(String colorName) {
  Map<String, Color> colorMap = {
    'amber': Colors.amber,
    'black': Colors.black,
    'blue': Colors.blue,
    'blueaccent': Colors.blueAccent,
    'brown': Colors.brown,
    'cyan': Colors.cyan,
    'deeporange': Colors.deepOrange,
    'deeporangeaccent': Colors.deepOrangeAccent,
    'deepPurple': Colors.deepPurple,
    'deeppurpleaccent': Colors.deepPurpleAccent,
    'green': Colors.green,
    'greenaccent': Colors.greenAccent,
    'grey': Colors.grey,
    'indigo': Colors.indigo,
    'indigoaccent': Colors.indigoAccent,
    'lightblue': Colors.lightBlue,
    'lightblueaccent': Colors.lightBlueAccent,
    'lightgreen': Colors.lightGreen,
    'lightgreenaccent': Colors.lightGreenAccent,
    'lime': Colors.lime,
    'limeaccent': Colors.limeAccent,
    'orange': Colors.orange,
    'orangeaccent': Colors.orangeAccent,
    'pink': Colors.pink,
    'pinkaccent': Colors.pinkAccent,
    'purple': Colors.purple,
    'purpleaccent': Colors.purpleAccent,
    'red': Colors.red,
    'redaccent': Colors.redAccent,
    'teal': Colors.teal,
    'tealaccent': Colors.tealAccent,
    'yellow': Colors.yellow,
    'yellowaccent': Colors.yellowAccent,
    'white': Colors.white,
  };

  String lowercaseColorName = colorName.toLowerCase();

  return colorMap[lowercaseColorName] ?? Colors.black;
}