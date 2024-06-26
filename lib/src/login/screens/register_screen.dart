import 'package:bookstore/common/redirect_service.dart';
import 'package:bookstore/common/styles/custom_button.dart';
import 'package:bookstore/common/styles/custom_theme.dart';
import 'package:bookstore/common/styles/text_field_style.dart';
import 'package:bookstore/src/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [CustomTheme().colors.darkBlue, CustomTheme().colors.lightBlue, CustomTheme().colors.white],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 18.0, right: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      RedirectService.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      "Registro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomTheme().colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 100.0,
                    color: CustomTheme().colors.white,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: TextFieldStyle.general(labelText: "Nombre"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: TextFieldStyle.general(labelText: "Correo"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: TextFieldStyle.general(labelText: "Contraseña"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: TextFieldStyle.general(labelText: "Confirmar Contraseña"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomButton.button(title: const Text("Regístrate"), onPressed: () {}),
                ],
              )),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
                onPressed: () {
                  RedirectService.goTo(context, LoginScreen());
                },
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
