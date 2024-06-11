import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project1/screens/ticket_info/tickets_list.dart';
import '../Model/ticket.dart';  
import 'package:firebase_auth/firebase_auth.dart';
import '../global_widgets/app_bar.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  int _selectedIndex = 0; 
  static List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    checkLoginState();
      _widgetOptions = [
      buildContactForm(),
      TicketsList(),
    ];
    
  }

  void checkLoginState() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Navigator.pushReplacementNamed(context, "/contact_form");
    }
  }

  Widget buildContactForm() {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Contact Form',
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 30, 9, 223)),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                } catch (e) {
                  print("Error signing out: $e");
                } 
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                }
              ),
              TextFormField(
                controller: contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),  
                validator: (value) => value == null || value.isEmpty ? 'Please enter a contact number' : null,
              ),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(labelText: 'Message'), 
                validator: (value) => value == null || value.isEmpty ? 'Please enter a message' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20), 
            ],
          ),
        ),
      )
    );
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      final ticket = Ticket(
        name: nameController.text,
        email: emailController.text,
        contactNumber: contactController.text,
        message: messageController.text,
      );

      try {
        await FirebaseFirestore.instance.collection('contacts').add(ticket.toJson());
        Fluttertoast.showToast(msg: "Successfully Submitted!");
        
        nameController.clear();
        emailController.clear();
        contactController.clear();
        messageController.clear();
      } catch (e) {
        Fluttertoast.showToast(msg: "Failed to submit: $e");
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), 
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tickets',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 30, 9, 223),
        onTap: _onItemTapped,
      ),
    );
  }
}
