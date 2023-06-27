import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytelephone/screens/auth_page.dart';
import 'firebase_options.dart';
import 'screens/signup_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  await Hive.openBox("widgets_values");
  await Hive.openBox("bordaBox");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            const Text(
              'Seja bem-vindo ao',
              style: TextStyle(fontSize: 20, fontFamily: 'Caprasimo'),
            ),
            const Text(
              'GoPizza!',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Shrikhand'),
            ),
            Image.asset(
              '../assets/images/pizza.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 40),
            const Text(
              'Conheça o cardápio e monte seu pedido com facilidade',
              style: TextStyle(
                  fontFamily: 'PathwayExtreme', fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.start),
              label: const Text('Continuar'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AuthPage();
                },
              )),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    }),
            )
          ],
        ),
      ),
    ));
  }
}
