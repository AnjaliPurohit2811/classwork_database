import 'dart:typed_data';

import 'package:classwork_database/newdatabase/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DbPage extends StatelessWidget {
  const DbPage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        title: Text('DataBase Storage'),
      ),
      body: Obx(() =>
          ListView.builder(
            itemCount: dbController.userList.length,
            itemBuilder: (context, index) => ListTile(leading: Image.memory(dbController.userList[index].photo!),
            title: Text(dbController.userList[index].name),
            trailing: Text(dbController.userList[index].age.toString()),),
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openBox(context, dbController);
      },child: Icon(Icons.add),),
    );
  }
}
void openBox(BuildContext context , DbController dbController){
  showDialog(context: context, builder: (context) => AlertDialog(content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(onPressed: () async {
        ImagePicker imagePicker = ImagePicker();
        XFile? xFile = await imagePicker.pickImage(source: ImageSource.camera);
        img = await xFile!.readAsBytes();
      }, icon: Icon(Icons.photo)),
      TextField(controller: txtname,),
      TextField(controller: txtage,),
    ],
  ),
  actions: [
    TextButton(onPressed: () {
     Navigator.pop(context);
     dbController.addUser(txtname.text, int.parse(txtage.text), img!);
    }, child: Text('Save'))
  ],),);
}
TextEditingController txtname = TextEditingController();
TextEditingController txtage = TextEditingController();
Uint8List? img;

