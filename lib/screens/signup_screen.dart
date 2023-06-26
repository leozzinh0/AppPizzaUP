import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                            'Cadastre-se agora',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Caprasimo',
                              fontSize: 35,
                              letterSpacing: -1.5,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 24)),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(12)),
                              Expanded(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.account_circle),
                                          border: OutlineInputBorder(),
                                          labelText: 'Nome'))),
                              Padding(padding: EdgeInsets.all(12)),
                              Expanded(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Sobrenome'))),
                              Padding(padding: EdgeInsets.all(12)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                border: OutlineInputBorder(),
                                labelText: 'Endereço',
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(12)),
                              SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Bairro'))),
                              SizedBox(width: 10.0),
                              Expanded(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Número'))),
                              Padding(padding: EdgeInsets.all(12)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe um e-mail válido';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
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
                          Padding(
                              padding: EdgeInsets.all(24.0),
                              child: ElevatedButton(
                                  child: const Text('Cadastrar'),
                                  onPressed: () {
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text)
                                        .then((value) {
                                      print("Conta nova criada");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    }).onError((error, stackTrace) {
                                      print('Erro ${error.toString()}');
                                    });
                                  })),
                        ])))));
  }
}
