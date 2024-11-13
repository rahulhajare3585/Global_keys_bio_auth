import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:global_keys/messages/messages.dart';

class Customer {
  final String id;
  final String name;
  final String address;
  final String mobileNo;

  Customer({
    required this.id,
    required this.name,
    required this.address,
    required this.mobileNo,
  });

  // Convert a Customer into a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'mobile_no': mobileNo,
    };
  }

  // Create a Customer object from a Firestore document
  factory Customer.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Customer(
      id: data['id'],
      name: data['name'],
      address: data['address'],
      mobileNo: data['mobile_no'],
    );
  }
}
