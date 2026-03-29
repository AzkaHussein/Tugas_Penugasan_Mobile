import 'package:flutter/material.dart';

class AlertMessage {
  void showAlert(BuildContext context, String message, bool status) {
    Color? warnaFill;
    Color warnaGaris;

    if (status) {
      warnaFill = Colors.green[200];
      warnaGaris = Colors.green;
    } else {
      warnaFill = Colors.pink[200];
      warnaGaris = Colors.red;
    }

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: warnaFill,
          border: Border.all(color: warnaGaris, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              color: status ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Text("X"),
            )
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
