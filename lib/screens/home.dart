import 'package:ase456_group_project/screens/advanced.dart';
import 'package:ase456_group_project/screens/scientific.dart';
import 'package:flutter/material.dart';
import 'package:ase456_group_project/screens/simple.dart';
import 'package:ase456_group_project/screens/money.dart';
//import 'package:ase456_group_project/screens/unit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int tab = 0;

  void selectItem(int itemIndex) {
    setState(() {
      tab = itemIndex;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: [Simple(), ScientificCalculator(), AdvancedCalculator(), Money()][tab],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Simple Calculator"),
              onTap: () {
                selectItem(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Scientific"),
              onTap: () {
                selectItem(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Advanced"),
              onTap: () {
                selectItem(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Money Converter"),
              onTap: () {
                selectItem(3);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.arrow_right),
            //   title: const Text("Units Converter"),
            //   onTap: () {
            //     selectItem(4);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                width: 260,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  "Basic",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ]),
    ));
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                width: 260,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  "Scientific",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ]),
    ));
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                width: 260,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  "Advanced",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ]),
    ));
  }
}
