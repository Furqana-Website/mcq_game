import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> colors = ['Red', 'Green', 'Blue', 'Yellow'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Index Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Index Example'),
        ),
        body: Column(
          children: List.generate(colors.length, (index) {
            return GestureDetector(
              onTap: () {
                print('Container index: $index');
                // Do something with the index
              },
              child: Container(
                height: 100,
                color: Colors.primaries[index % Colors.primaries.length],
                margin: EdgeInsets.all(10),
              ),
            );
          }),
        ),
      ),
    );
  }
}
