import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Special App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;
  int numCounter = 0;
  var isChecked = false;
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setNewValue(double val) {
    setState(() {
      _counter = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("This is the drawer section!"),
      ),
      appBar: AppBar(
        actions: [
          OutlinedButton(onPressed: () {}, child: Text("Button 1")),
          OutlinedButton(onPressed: () {}, child: Text("Button 2"))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.call),
                  Text(
                    "Call".toUpperCase(),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                  Text(
                    "Route".toUpperCase(),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.share,
                    color: Colors.teal,
                  ),
                  Text("Share".toUpperCase(),
                      style: const TextStyle(color: Colors.red))
                ],
              )
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset("images/ac_logo.jpg", width: 400),
              Text(
                "Algonquin College",
                style: TextStyle(fontSize: 30.0),
              )
            ],
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.add_call), label: "Phone")
        ],
        onTap: (btnIndex) {
          if (btnIndex == 0) {
            print("Camera button clicked");
          } else {
            print("Phone button was clicked");
          }
        },
      ),
    );
  }
}
