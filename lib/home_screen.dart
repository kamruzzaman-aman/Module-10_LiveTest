import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: isSelected.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: isSelected[index] ? Colors.blue : null,
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            title: Text('Item ${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              int selectedCount =
                  isSelected.where((selected) => selected).length;
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('Number of Selected Items: $selectedCount'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
