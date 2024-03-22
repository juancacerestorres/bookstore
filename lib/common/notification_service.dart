import 'package:flutter/material.dart';

enum TypeSnackBar { alert, success, warning, info, dark }

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? message, TypeSnackBar type) {
    Color color;
    switch (type) {
      case TypeSnackBar.alert:
        color = const Color(0xffc0392b);
        break;
      case TypeSnackBar.success:
        color = const Color(0xFF2ecc71);
        break;
      case TypeSnackBar.warning:
        color = const Color(0xFFf1c40f);
        break;
      case TypeSnackBar.info:
        color = const Color.fromARGB(255, 60, 60, 60);
        break;
      case TypeSnackBar.dark:
        color = const Color.fromRGBO(60, 60, 60, 1);
        break;
      default:
        color = const Color(0xffecf0f1);
    }

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(
        message!,
      ),
    );
    messengerKey.currentState?.showSnackBar(snackbar);
  }

  static showSnackBarWithIcon(String? message, TypeSnackBar type, Widget icon) {
    Color color;
    switch (type) {
      case TypeSnackBar.alert:
        color = const Color(0xffc0392b);
        break;
      case TypeSnackBar.success:
        color = const Color(0xFF30B36B);
        break;
      case TypeSnackBar.warning:
        color = const Color(0xFFf1c40f);
        break;
      case TypeSnackBar.info:
        color = const Color(0xFF4D5451);
        break;
      case TypeSnackBar.dark:
        color = const Color.fromRGBO(60, 60, 60, 1);
        break;
      default:
        color = const Color(0xffecf0f1);
    }

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: icon,
          ),
          Text(
            message!,
          ),
        ],
      ),
    );
    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showBusyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Image.asset(
            "assets/images/loading_ball.gif",
            height: 30,
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (_) => dialog);
  }
}
