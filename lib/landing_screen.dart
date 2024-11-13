import 'package:flutter/material.dart';
import 'package:global_keys/pages/biometric_auth_screen.dart';
import 'package:global_keys/pages/keys_landing_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen() : super();

  @override
  State<StatefulWidget> createState() => _landingScreen();
}

class _landingScreen extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Global keys & authentication'),
          backgroundColor: Colors.deepPurple,
        ),
        body: buttonsContainer());
  }

  Widget buttonsContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // Navigate to Biometric Authentication page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BiometricAuthScreen()),
                );
              },
              child: const Text('Biometric authentication')),
          ElevatedButton(
              onPressed: () {
                // Navigate to Biometric Authentication page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeysLandingPage()),
                );
              },
              child: const Text('Global Keys')),
        ],
      ),
    );
  }
}
