import 'package:flutter/material.dart';
import '../windgets/widgets.dart';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({super.key});

  @override
  State<CRUDScreen> createState() => _CRUDScreenState();
}

class _CRUDScreenState extends State<CRUDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Flutter', 'CRUD'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewCRUD(label: 'Name'),
            NewCRUD(label: 'Age'),
            NewCRUD(label: 'Location'),
            ElevatedButton(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text('Add'),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
