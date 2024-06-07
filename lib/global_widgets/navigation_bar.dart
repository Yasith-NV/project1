import 'package:flutter/material.dart';
import '../screens/contact_form.dart';  
import '../screens/ticket_info/tickets_list.dart';  
import 'drawer.dart';  
import '../screens/ticket_info/ticket_details.dart';
import '../screens/login_and_signup/login_page.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  int _currentIndex = 0; 
  final List<Widget> _screens = [
    ContactForm(),
    TicketsList(),
  

    
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Drawer',
          ),
        ],
      ),
    );
  }
}
