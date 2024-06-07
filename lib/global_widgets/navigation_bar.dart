// import 'package:flutter/material.dart';
// import '../screens/contact_form.dart'; 
// import '../screens/ticket_info/tickets_list.dart';  
// import 'drawer.dart'; 

// class MainNavigation extends StatefulWidget {
//   @override
//   _MainNavigationState createState() => _MainNavigationState();
// }

// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//     ContactForm(),       
//     TicketsList(),
//     AppDrawer(),   
//   ];

//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onTap,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Tickets',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.more),
//             label: 'More',
//           ),
//         ],
//       ),
//     );
//   }
// }
