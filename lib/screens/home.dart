import 'package:flutter/material.dart';
import 'package:ase456_group_project/screens/simple.dart';
import 'package:ase456_group_project/screens/money.dart';

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
      body: [Simple(), Money()][tab],
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
              title: const Text("Money Converter"),
              onTap: () {
                selectItem(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
