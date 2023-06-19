import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytelephone/homepage.dart';

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
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cadastre-se agora',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
                                      print("Error ${error.toString()}");
                                    });
                                  })),
                        ])))));
  }
}
