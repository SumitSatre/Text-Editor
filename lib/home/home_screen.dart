import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/home/models/dropdown_lists.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "MyHomePage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double _left = 0.0, _top = 0.0;
  double _containerWidth = 0.0;
  double _containerHeight = 0.0;
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {

   // final controller = Provider.of<HomeController>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<HomeController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Text Editor" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w400 , fontSize: 25),),
              backgroundColor: Colors.white24,
              elevation: 0.3,
            ),
          resizeToAvoidBottomInset: false,

          body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: height*0.6,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                         color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          _containerWidth = constraints.maxWidth;
                          _containerHeight = constraints.maxHeight;

                          return Stack(
                            children: [
                              Positioned(
                                left: _left,
                                top: _top,
                                child: GestureDetector(
                                  onPanUpdate: (details) {
                                    _left = min(
                                      max(0, _left + details.delta.dx),
                                      _containerWidth - 100,
                                    );
                                    _top = min(
                                      max(0, _top + details.delta.dy),
                                      _containerHeight - 100,
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.cyanAccent,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Text(
                                      controller.boxContent,
                                      style: TextStyle(
                                        fontSize: double.parse(controller!.fontSize),
                                        fontFamily: controller.fontFamily,
                                        color: getColorByName(controller.fontColor),
                                      ),
                                      maxLines: double.parse(controller!.fontSize) >= 20 ? (double.parse(controller!.fontSize) >= 32 ? 2 :3) : 10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: height*0.6,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Font Family : " , style: TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),

                          SizedBox(
                            height: height*0.01,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: height * 0.06,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      elevation: 4,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      value: controller.fontFamily,
                                      onChanged: (p0) {
                                        controller.fontFamily = p0 == null ? "Lato" : p0;
                                        print(controller.fontFamily);

                                        controller.onStateChange(controller.boxContent , controller.fontFamily , controller.fontSize , controller.fontColor);

                                        setState(() {});
                                      },
                                      items: fontFamilies
                                          .map<DropdownMenuItem<String>>((String s) {
                                        return DropdownMenuItem<String>(
                                          value: s,
                                          child: Text("  $s"),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: height*0.02,
                          ),

                          Text("Font Size : " , style: TextStyle(
                              fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),),

                          SizedBox(
                            height: height*0.01,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: height * 0.06,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      elevation: 4,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      value: controller.fontSize,
                                      onChanged: (p0) {
                                        controller.fontSize = p0 == null ? "15" : p0;
                                        controller.onStateChange(controller.boxContent , controller.fontFamily , controller.fontSize , controller.fontColor);
                                        setState(() {});
                                      },
                                      items: fontSizeList
                                          .map<DropdownMenuItem<String>>((String s) {
                                        return DropdownMenuItem<String>(
                                          value: s,
                                          child: Text("  $s"),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: height*0.02,
                          ),

                          Text("Font Color : " , style: TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.w500
                          ),),

                          SizedBox(
                            height: height*0.01,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: height * 0.06,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      elevation: 4,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      value: controller.fontColor,
                                      onChanged: (p0) {
                                        controller.fontColor = p0 == null ? "black" : p0;
                                        controller.onStateChange(controller.boxContent , controller.fontFamily , controller.fontSize , controller.fontColor);
                                        setState(() {});
                                      },
                                      items: colorNamesList
                                          .map<DropdownMenuItem<String>>((String s) {
                                        return DropdownMenuItem<String>(
                                          value: s,
                                          child: Text("  $s"),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: height*0.02,
                          ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: Icons.undo,
                              label: 'Undo',
                              onPressed: () {
                                controller.undo();
                                print('Undo Button Pressed');
                              },
                            ),
                            SizedBox(width: 16.0),
                            CircularButton(
                              icon: Icons.redo,
                              label: 'Redo',
                              onPressed: () {
                                controller.redo();
                                print('Redo Button Pressed');
                              },
                            ),
                          ],
                        ),
                      ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      controller: text,
                      onChanged: (p0) {},
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.grey.shade600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 22,
                      cursorWidth: 1.8,
                    ),

                    SizedBox(
                      height: height*0.02,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width*0.4,
                          height: height*0.05,
                          child: ElevatedButton(
                            onPressed: () {

                              controller.boxContent += text.text;
                              text.clear();
                              controller.onStateChange(controller.boxContent , controller.fontFamily , controller.fontSize , controller.fontColor);
                              setState(() {

                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffAD2F3B),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Set padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Set border radius
                              ),
                              elevation: 2, // Set elevation
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(fontSize: 16), // Set text style
                            ),
                          ),
                        ),

                        SizedBox(
                          width: width*0.05,
                        ),

                        Container(
                          width: width*0.4,
                          height: height*0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.boxContent = "";
                              text.clear();
                              controller.onClear();
                              setState(() {

                              });
                            },
                            style: ElevatedButton.styleFrom(

                              backgroundColor: Color(0xffAD2F3B),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Set padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Set border radius
                              ),
                              elevation: 2, // Set elevation
                            ),
                            child: Text(
                              "Clear",
                              style: TextStyle(fontSize: 16), // Set text style
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
              ),


        );
      }
    );
  }
}


class CircularButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  CircularButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xffAD2F3B),
              borderRadius: BorderRadius.circular(25),

            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          SizedBox(
            height: 5,
          ),

          Text(
            label
          )
        ],
      ),
    );
  }


}
