import 'package:flutter/material.dart';
import 'package:web/ui/widgets/buttons/iconButtonUserPage.dart';
import 'package:web/ui/widgets/textField/userPageTextFieled.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, String>> users = [
    {
      'name': 'Mustafa Furkan Özgenç',
      'subtitle': 'Yazılım Mühendisi',
    },
    {
      'name': 'Mustafa Gönültaş',
      'subtitle': 'Yazılım Mühendisi',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final userName = TextEditingController();
    final userTitle = TextEditingController();

    print(users);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kullanıcılar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButtonWidget(
                users: users,
                context: context,
                isEdit: false,
                userNameController: userName,
                userTitleController: userTitle,
                title: 'Kullanıcı Ekle',
                onModalClose: () {
                  setState(() {});
                }),
          ),
        ],
      ),
      body: _listView(users: users, userName: userName, userTittle: userTitle),
    );
  }
}

// ignore: camel_case_types
class _listView extends StatefulWidget {
  const _listView(
      {required this.users, required this.userName, required this.userTittle});

  final List<Map<String, String>> users;
  final TextEditingController userName;
  final TextEditingController userTittle;
  @override
  State<_listView> createState() => _ListViewState();
}

class _ListViewState extends State<_listView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        final user = widget.users[index];
        return ListTile(
          leading: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.person_2_rounded,
              color: Colors.deepOrange,
            ),
          ),
          selectedColor: Colors.teal,
          title: Text(user['name']!),
          subtitle: Text(user['subtitle']!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButtonWidget(
                user: user,
                context: context,
                index: index,
                isEdit: true,
                userNameController: widget.userName,
                userTitleController: widget.userTittle,
                title: 'Kullanıcı Düzenle',
                users: widget.users,
                onModalClose: () {
                  setState(() {});
                },
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        );
      },
    );
  }
}
