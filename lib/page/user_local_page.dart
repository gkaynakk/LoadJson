import 'package:flutter/material.dart';
import 'package:flutter_more/api/users_api.dart';
import 'package:flutter_more/model/user.dart';

class UserLocalPage extends StatelessWidget {
  @override
  //futurebuilder:"future of handling futures"
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<User>>(
          future: UserApi.getUsersLocally(context),
          builder: (context, snapshot) {
            //Liste halinde gelen datamızı widget olarak yapılandırıyoruz.
            final users = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child:
                        CircularProgressIndicator()); //Datayı beklerkene dönüyor.
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Hata oluştu!'));
                } else {
                  return buildUsers(users);
                }
            }
          },
        ),
      );
  //Lokal dosyamızdan yüklediğimiz datayı buraya koymak istiyoruz.
  Widget buildUsers(List<User> users) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          //Her kullanıcıyı ayrı ayrı oluşturuyoruz.
          final user = users[index];

          return ListTile(
            title: Text(user.title),
            subtitle: Text(user.body),
          );
        },
      );
}
