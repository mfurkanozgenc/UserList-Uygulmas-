import 'package:flutter/material.dart';
import 'package:web/pages/users_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentIndex = 0;
  final List<Widget> body = [
    const UsersPage(),
    const Icon(Icons.menu),
    const Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        enableFeedback: false,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Kullanıcılar', icon: Icon(Icons.groups)),
          BottomNavigationBarItem(label: 'Menü', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: 'Ayarlar', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
