import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytelephone/screens/login_screen.dart';

import 'screens/signup_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  await Hive.openBox("widgets_values");
  await Hive.openBox("bordaBox");

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB9lNGzfsyORNEYF6zuFaZ-4ZMHR-uHTgY",
          authDomain: "deliveryapp2705.firebaseapp.com",
          databaseURL: "https://deliveryapp2705-default-rtdb.firebaseio.com",
          projectId: "deliveryapp2705",
          storageBucket: "deliveryapp2705.appspot.com",
          messagingSenderId: "598180524456",
          appId: "1:598180524456:web:4774bb73b2f1ad5245ed9d"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoPizza!',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(253, 251, 247, 129)),
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/pizza.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Seja bem-vindo!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Conheça o cardápio e monte seu pedido com facilidade',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              icon: const Icon(Icons.start),
              label: const Text('Fazer login'),
              onPressed: () {
                _navigateToNextScreen(context);
              },
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                  text: 'Ainda não tem conta? Cadastre-se agora.',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 243, 93, 33),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _navigateToCadastroScreen(context);
                    }),
            )
          ],
        ),
      ),
    ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  void _navigateToCadastroScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
      (Route<dynamic> route) => false,
    );
  }
}
