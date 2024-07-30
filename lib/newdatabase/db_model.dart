

import 'package:flutter/services.dart';

class User {
late int id, age;
late String name;
Uint8List? photo;

User(this.id, this.name,this.age,this.photo);
factory User.fromMap(Map m1){
  return User(m1['id'], m1['name'], m1['age'], m1['photo']);
}
}