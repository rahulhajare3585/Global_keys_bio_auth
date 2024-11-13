import 'package:flutter/material.dart';
import 'package:global_keys/Services/firebase_service.dart';
import 'package:global_keys/models/customer.dart';

class FirebasePage extends StatelessWidget {
  const FirebasePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = FirebaseService();

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Customer Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Create a new customer object
            Customer newCustomer = Customer(
              id: 'customer1', // You can generate a unique ID or use Firestore auto-ID
              name: 'Rahul Hajare',
              address: 'Ahmednagr',
              mobileNo: '9970662978',
            );

            // Call FirebaseService to add the customer
            await firebaseService.addCustomer(newCustomer);
          },
          child: const Text('Add Customer'),
        ),
      ),
    );
  }
}
