import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        const SizedBox(height: 20),
        Container(
          height: 50,
          color: Colors.amber[600],
          child: Center(child: Text('Borda: ')),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
