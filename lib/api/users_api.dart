import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_more/model/user.dart';

class UserApi {
  static Future<List<User>> getUsers() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(url); //internetten verimizi çekiyoruz.
    final body = json.decode(response.body);

    return body.map<User>(User.fromJson).toList();
  }

  //Lokal olarak kullanıcılarımıza erişim sağlıyoruz.
  static Future<List<User>> getUsersLocally(BuildContext context) async {
    //Kullanıcılarımızı yüklüyoruz(load)
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/Deneme.json');
    final body = json.decode(
        data); //Json objesine çeviriyoruz. body json dosyamızda gömülü farklı kullanıcıları barındırıyor.

    return body
        .map<User>(User.fromJson)
        .toList(); //Liste halinde kullanıcılarımızı geri döndürüyoruz.
  }
}
