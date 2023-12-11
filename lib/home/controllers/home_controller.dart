import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


class TextModel {
  late String boxText;
  late String fontFamily;
  late String fontSize;
  late String fontColor;

  TextModel({
    required this.boxText,
    required this.fontFamily,
    required this.fontSize,
    required this.fontColor,
  });

  TextModel copyWith({
    String? boxText,
    String? fontFamily,
    String? fontSize,
    String? fontColor,
  }) {
    return TextModel(
      boxText: boxText ?? this.boxText,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontColor: fontColor ?? this.fontColor,
    );
  }
}


class HomeController extends ChangeNotifier {
  String fontSize = "15";
  String fontFamily = "serif";
  String fontColor = "Black";
  String boxContent = "";

  List<TextModel> undoStack = [];
  List<TextModel> redoStack = [];

  void onStateChange( String containertext, String family, String size, String color){
    print("${containertext} , ${family} , ${color} , ${size}");
    TextModel temp = new TextModel(boxText: containertext, fontFamily: family, fontSize: size, fontColor: color);

    undoStack.add(temp);

    notifyListeners();
  }



  void undo(){

    if(undoStack.length == 1){
      TextModel poppedElement = undoStack.removeLast();
      redoStack.add(poppedElement);
      this.fontSize = "15";
      this.fontFamily = "serif";
      this.fontColor = "Black";
      this.boxContent = "";
      notifyListeners();
      return;
    }


    if(undoStack.isNotEmpty){
      TextModel poppedElement = undoStack.removeLast();

      redoStack.add(poppedElement);

      TextModel last = undoStack.last;

      this.boxContent = last.boxText;
      this.fontFamily = last.fontFamily;
      this.fontSize = last.fontSize;
      this.fontColor = last.fontColor;

      print("${this.boxContent} , ${this.fontFamily} , ${this.fontColor} , ${this.fontSize}");
    }

    notifyListeners();
  }

  void redo() {
    if (redoStack.isNotEmpty) {
      TextModel poppedElement = redoStack.removeLast();

      undoStack.add(poppedElement);

      this.boxContent = poppedElement.boxText;
      this.fontFamily = poppedElement.fontFamily;
      this.fontSize = poppedElement.fontSize;
      this.fontColor = poppedElement.fontColor;

      print("redo : ${this.boxContent}, ${this.fontFamily}, ${this.fontColor}, ${this.fontSize}");
    }
    notifyListeners();
  }

  void onClear(){
    this.fontSize = "15";
    this.fontFamily = "serif";
    this.fontColor = "Black";
    this.boxContent = "";
    this.undoStack.clear();
    this.redoStack.clear();
    notifyListeners();

  }

}