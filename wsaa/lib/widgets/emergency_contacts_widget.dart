import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact_model.dart';

class EmergencyContactsWidget extends StatefulWidget {
  final String userId;

  EmergencyContactsWidget({required this.userId});

  @override
  _EmergencyContactsWidgetState createState() => _EmergencyContactsWidgetState();
}

class _EmergencyContactsWidgetState extends State<EmergencyContactsWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _addContact() async {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      Contact contact = Contact(name: _nameController.text, phoneNumber: _phoneController.text);
      await _firestore.collection('users').doc(widget.userId).collection('contacts').add(contact.toMap());
      _nameController.clear();
      _phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(labelText: 'Phone Number'),
        ),
        ElevatedButton(
          onPressed: _addContact,
          child: Text('Add Contact'),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('users').doc(widget.userId).collection('contacts').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              List<Contact> contacts = snapshot.data!.docs.map((doc) => Contact.fromMap(doc.data() as Map<String, dynamic>)).toList();
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phoneNumber),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
