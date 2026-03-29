import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_nav.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Text("Movie"),
      bottomNavigationBar: BottomNav(1), 
    );
  }
}
