import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:global_keys/messages/messages.dart';
import 'package:global_keys/models/customer.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create a customer in Firestore
  Future<void> addCustomer(Customer customer) async {
    try {
      // Check if the collection 'customers' exists by attempting to fetch a document
      QuerySnapshot snapshot = await _db.collection('customers').limit(1).get();

      // If no documents exist, the collection will be implicitly created upon adding the first customer
      if (snapshot.docs.isEmpty) {
        print('Creating collection "customers" with the first customer.');
      }

      // Add the customer to the Firestore collection
      await _db.collection('customers').doc(customer.id).set(customer.toMap());
      Messages().ShowToast('Customer added successfully');
    } catch (e) {
      Messages().ShowToast('Error: $e');
    }
  }

  // Fetch all customers from Firestore
  Stream<List<Customer>> getCustomers() {
    return _db.collection('customers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Customer.fromFirestore(doc)).toList();
    });
  }
}
