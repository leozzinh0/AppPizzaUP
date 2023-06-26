import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var fsi = FirebaseFirestore.instance;

class Conta extends StatefulWidget {
  const Conta({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Olá, @Usuario!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: xxxxxx@gmail.com Telefone: 19-999999999',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
