// import 'package:flutter/material.dart';

// class AppDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Bottom Drawer")),
//       body: const Center(
//         child: Text("test"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Drawer Header',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () {
//                 // Navigate to home
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text('Sign Out'),
//               onTap: () {
//                 // Sign out logic here
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Assuming you have a login page defined as a named route
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login Page")),
//       body: const Center(
//         child: Text("Login"),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//       '/': (context) => AppDrawer(),
//       '/login': (context) => LoginPage(),
//     },
//   ));
// }
