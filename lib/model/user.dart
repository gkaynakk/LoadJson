import 'package:meta/meta.dart';

class User {
  //Kullanıcalarımıza erişebilmek için model oluşturuyoruz.

  final String title;
  final String body;

  const User({
    @required this.title,
    @required this.body,
  });
  static User fromJson(json) => User(
        title: json['title'],
        body: json['body'],
      );
}
