import 'package:flutter/material.dart';
import 'package:global_keys/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_keys/messages/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Messages().ShowToast('connected to firebase');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}
