import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list/Banco/shared_pref_helper.dart';
import 'package:list/Pages/HomePage.dart';
import 'package:list/Pages/LoginPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    bool isLogged = await SharedPrefHelper().getUser();
    await Future.delayed(const Duration(seconds: 5));
    if (isLogged == true) {
      // Se logado, chamar HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    } else {
      // Chamar página de Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10777b),
      body: Center(
        child: Image.asset('assents/AraSaúde.png'),
      ),
    );
  }
}
