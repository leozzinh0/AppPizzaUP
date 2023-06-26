import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mytelephone/homepage.dart';

import 'signup_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Faça seu login',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Caprasimo',
                              fontSize: 35,
                              letterSpacing: -1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe o email corretamente!';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                                labelText: 'Senha',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe sua senha!';
                                } else if (value.length < 6) {
                                  return 'Sua senha deve ter no mínimo 6 caracteres';
                                }
                                return null;
                              },
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Ainda não tem conta? Cadastre-se agora.',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 243, 93, 33),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUpPage();
                                    }));
                                  }),
                          ),
                          Padding(
                              padding: EdgeInsets.all(24.0),
                              child: ElevatedButton(
                                  child: const Text('Entrar'),
                                  onPressed: () {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text)
                                        .then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }).onError((error, stackTrace) {
                                      final snackBar = SnackBar(
                                        content:
                                            Text('E-mail ou senha inválidos.'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      print("Error ${error.toString()}");
                                    });
                                  })),
                        ])))));
  }
}
