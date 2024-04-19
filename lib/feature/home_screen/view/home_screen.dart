import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/repositories/database.dart';
import '../windgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();

  Stream? itemStream;

  Widget getItems() {
    return StreamBuilder(
      stream: itemStream,
      builder: (context, snapshop) {
        return snapshop.hasData
            ? ListView.builder(
                itemCount: snapshop.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshop.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${ds['name']}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Age: ${ds['age']}",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Location: ${ds['location']}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    nameController.text = ds['name'];
                                    ageController.text = ds['age'];
                                    locationController.text = ds['location'];
                                    editItems(ds['id']);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : SizedBox();
      },
    );
  }

  loadItems() async {
    itemStream = await DatabaseMethods().getItem();
    setState(() {});
  }

  Future editItems(String id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel),
                    ),
                    Text("EditDetails"),
                  ],
                ),
                NewCRUD(label: 'Name', controller: nameController),
                NewCRUD(label: 'Age', controller: ageController),
                NewCRUD(label: 'Location', controller: locationController),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> updatedData = {
                      'name': nameController.text,
                      'age': ageController.text,
                      'location': locationController.text,
                      'id': id
                    };
                    await DatabaseMethods().updateItems(id, updatedData);
                  },
                  child: Text('update'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('crud_screen');
        },
      ),
      appBar: CustomAppbar(title1: 'Flutter', title2: 'Firebase'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: getItems()),
          ],
        ),
      ),
    );
  }
}
