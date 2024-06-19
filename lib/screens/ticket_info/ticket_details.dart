import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project1/model/ticket.dart';

@RoutePage()

class TicketDetail extends StatefulWidget {
  final String documentId;

  const TicketDetail({required this.documentId});

  @override
  _TicketDetailState createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchTicket();
  }

  void _fetchTicket() async {
    try {
      DocumentSnapshot document = await _firestore.collection('contacts').doc(widget.documentId).get();
      if (document.exists) {
        Ticket ticket = Ticket.fromJson(document.data() as Map<String, dynamic>);
        _nameController.text = ticket.name;
        _emailController.text = ticket.email;
        _contactController.text = ticket.contactNumber;
        _messageController.text = ticket.message;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to fetch ticket: $e');
    }
  }

  void _updateTicket() async {
    if (_formKey.currentState!.validate()) {
      try {
        Ticket updatedTicket = Ticket(
          name: _nameController.text,
          email: _emailController.text,
          contactNumber: _contactController.text,
          message: _messageController.text,
        );
        await _firestore.collection('contacts').doc(widget.documentId).update(updatedTicket.toJson());
        Fluttertoast.showToast(msg: "Ticket updated successfully!");
      } catch (e) {
        Fluttertoast.showToast(msg: "Error updating ticket: $e");
      }
    }
  }

  void _deleteTicket() async {
    try {
      await _firestore.collection('contacts').doc(widget.documentId).delete();
      Fluttertoast.showToast(msg: "Ticket deleted successfully!");
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to delete ticket: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteTicket,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter Name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a contact number' : null,
              ),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a Message' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateTicket,
                child: const Text('Update Ticket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}