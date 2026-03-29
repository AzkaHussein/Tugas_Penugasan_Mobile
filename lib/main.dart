import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginView/login_view.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/register_user_view.dart';
import 'package:flutter_application_1/views/movie_view.dart';
import 'package:flutter_application_1/views/pesan_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      // halaman pertama yang dibuka
      initialRoute: '/login',

      routes: {
        '/register': (context) => const RegisterUserView(),
        '/login': (context) => const LoginView(),
        '/dashboard': (context) => const DashboardView(),
        '/movie': (context) => const MovieView(),
        '/pesan': (context) => const PesanView(),
      },
    );
  }
}
