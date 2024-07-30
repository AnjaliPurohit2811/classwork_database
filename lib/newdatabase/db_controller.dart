import 'package:classwork_database/newdatabase/db_helper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'db_model.dart';

class DbController extends GetxController{
  RxList<User>userList = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void>fetchUser() async {
    final data = await DbHelper.dbHelper.fetchData();
    userList.value = data.map((e) => User.fromMap(e),).toList();
  }

  void addUser(String name,int age,Uint8List photo){
    DbHelper.dbHelper.insertData(name,age,photo);
    fetchUser();
  }
}