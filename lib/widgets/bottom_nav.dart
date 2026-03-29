import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_login.dart';

class BottomNav extends StatefulWidget {
  final int activePage;

  const BottomNav(this.activePage, {super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  String? role;

  // ambil data login
  Future<void> getDataLogin() async {
    var user = await UserLogin.getUserLogin();

    if (user.status != false) {
      setState(() {
        role = user.role;
      });
    } else {
      Navigator.popAndPushNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataLogin();
  }

  // =============================
  // FUNCTION NAVIGASI MENU
  // =============================
  void getLink(int index) {
    if (role == "admin") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/movie');
      }
    } else if (role == "kasir") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/pesan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (role == null) {
      return const SizedBox();
    }

    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.activePage,

      // event klik menu
      onTap: (index) => getLink(index),

      items: role == "admin"
          ? const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: "Movie",
              ),
            ]
          : const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: "Pesan",
              ),
            ],
    );
  }
}