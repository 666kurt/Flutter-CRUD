import 'package:flutter/material.dart';
import 'package:flutter_template/repositories/database.dart';
import 'package:random_string/random_string.dart';
import '../windgets/widgets.dart';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({super.key});

  @override
  State<CRUDScreen> createState() => _CRUDScreenState();
}

class _CRUDScreenState extends State<CRUDScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title1: 'Flutter', title2: 'CRUD'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewCRUD(label: 'Name', controller: nameController),
            NewCRUD(label: 'Age', controller: ageController),
            NewCRUD(label: 'Location', controller: locationController),
            ElevatedButton(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text('Add'),
                ),
              ),
              onPressed: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> itemMap = {
                  'name': nameController.text,
                  'age': ageController.text,
                  'location': locationController.text,
                };
                await DatabaseMethods().addItem(itemMap, id);
              },
            )
          ],
        ),
      ),
    );
  }
}
