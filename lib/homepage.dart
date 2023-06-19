import 'package:mytelephone/screens/cardapio.dart';
import 'package:mytelephone/screens/conta.dart';
import 'package:mytelephone/screens/order_screen.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(actions: [Icon(Icons.abc)]),
        //setState
        /*   appBar: AppBar(
          title: const Text(''),
        ),*/
        body: IndexedStack(
          index: _currentScreen,
          children: const [
            Cardapio(title: 'Tela1'),
            OrderScreen(title: 'Tela2'),
            Conta(title: 'Tela3'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Cardápio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cake), label: "Fazer pedido"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: "Minha Conta"),
          ],
          currentIndex: _currentScreen,
          fixedColor: Colors.red,
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
