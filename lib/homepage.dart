import 'package:mytelephone/screens/cardapio.dart';
import 'package:mytelephone/screens/conta.dart';
import 'package:mytelephone/screens/order_screen.dart';
import 'package:flutter/material.dart';

import 'screens/carrinho.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentScreen,
          children: const [
            Cardapio(title: 'Tela1'),
            OrderScreen(title: 'Tela2'),
            Carrinho(title: 'Tela3'),
            Conta(title: 'Tela4'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.deepOrange,
          unselectedLabelStyle: TextStyle(color: Colors.deepOrange),
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(color: Colors.deepOrange),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: "Cardápio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: "Fazer pedido"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Pedido"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Minha Conta"),
          ],
          currentIndex: _currentScreen,
          onTap: (int novaTela) {
            setState(() {
              _currentScreen = novaTela;
            });
          },
          /*	currentIndex: _currentScreen,
	onTap: (int novoItem) {
		setState(() => _currentScreen = novoItem); },
	fixedColor: Colors.red,*/
        ));
  }
}
