import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController _input = TextEditingController();

  var buttonList = <String>['Button 0', 'Button 1', 'Button 2'];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: AppBar(
          title: Text("Third Page"),
        ),
        body: reactiveLayout());

        
  }


  Widget reactiveLayout() {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    // Tablet
    if((width > height) && width > 720) {
      return Row(children: [
        Expanded(
          flex: 1,
          child: ImageText()),
        Expanded(
          flex: 1,
          child: ButtonList())
      ],);
    } else { // Mobile
      return Column(children: [
        ImageText(),
        ButtonList()
      ],);
    }
  } // reactiveLayout

  Widget ImageText() {
    return Column(children: [
      Image.asset("images/ac_logo.jpg", width: 400.0),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextField(
                  controller: _input,
                  decoration: InputDecoration(hintText: "Displays output value"),
                ),
              ),
    ],);
  }

  Widget ButtonList() {
    return Expanded(
                  child: ListView.builder(
                      itemCount: buttonList.length,
                      itemBuilder: (BuildContext context, int rowNum) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _input.text = "Button $rowNum was clicked";
                                });
                              }, child: Text(buttonList[rowNum])),
                        );
                      }));
  }
}
