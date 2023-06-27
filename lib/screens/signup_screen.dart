import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signUserUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    addUserDetails(
        firstNameController.text.trim(), emailController.text.trim());
  }

  void addUserDetails(String firstName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'email': email,
    });
  }

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
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle),
                                        border: OutlineInputBorder(),
                                        labelText: 'Nome'))),
                            Padding(padding: EdgeInsets.all(12)),
                            Expanded(
                                child: TextFormField(
                                    // controller: lastNameController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Sobrenome'))),
                            Padding(padding: EdgeInsets.all(12)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: TextFormField(
                            // controller: addressController,
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
                                    // controller: bairroController,
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
                              controller: emailController,
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
                            controller: passwordController,
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
                                onPressed: () async {
                                  signUserUp();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                }))
                      ]),
                ))));
  }
}
