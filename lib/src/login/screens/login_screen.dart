import 'package:bookstore/common/redirect_service.dart';
import 'package:bookstore/common/styles/custom_button.dart';
import 'package:bookstore/common/styles/custom_theme.dart';
import 'package:bookstore/common/styles/text_field_style.dart';
import 'package:bookstore/src/home/screens/home_books.dart';
import 'package:bookstore/src/login/blocs/login_bloc.dart';
import 'package:bookstore/src/login/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginEmailBloc loginEmailBloc = LoginEmailBloc();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 60.0, left: 8.0, right: 8.0),
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(
                  color: CustomTheme().colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_rounded,
                    size: 100.0,
                    color: CustomTheme().colors.white,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  StreamBuilder<String>(
                      stream: loginEmailBloc.emailStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: TextFieldStyle.textStyle(colorText: CustomTheme().colors.white),
                          onChanged: (value) {
                            loginEmailBloc.emailChange(value);
                          },
                          maxLines: 1,
                          decoration: TextFieldStyle.general(labelText: "Correo", errorText: snapshot.error as String?),
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder<String>(
                      stream: loginEmailBloc.passwordStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: TextFieldStyle.textStyle(colorText: CustomTheme().colors.white),
                          onChanged: (value) {
                            loginEmailBloc.passwordChange(value);
                          },
                          decoration:
                              TextFieldStyle.general(labelText: "Contraseña", errorText: snapshot.error as String?),
                          obscureText: true,
                        );
                      }),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomButton.button(
                    title: const Text("Ingresar"),
                    onPressed: () async {
                      bool response = await loginEmailBloc.login();
                      if (response) {
                        // ignore: use_build_context_synchronously
                        RedirectService.replaceAllPages(context, HomeBooks());
                      }
                    },
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
                onPressed: () {
                  RedirectService.goTo(context, const RegisterScreen());
                },
                child: Text(
                  "Registro",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                )),
            TextButton(
                onPressed: () {
                  RedirectService.replaceAllPages(context, HomeBooks());
                },
                child: Text(
                  "entrar como invitado",
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
