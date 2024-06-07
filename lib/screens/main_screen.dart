// import 'package:flutter/material.dart';
// import 'package:auto_route/auto_route.dart';
// import 'router.gr.dart'; // This should point to the generated router file

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsScaffold(
//       routes: const [
//         ContactFormRoute(),
//         TicketsListRoute(),
//       ],
//       bottomNavigationBuilder: (_, tabsRouter) {
//         return BottomNavigationBar(
//           currentIndex: tabsRouter.activeIndex,
//           onTap: tabsRouter.setActiveIndex,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tickets'),
//             BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
//           ],
//         );
//       },
//       drawerBuilder: (context, router) => Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header', style: TextStyle(color: Colors.white, fontSize: 24)),
//             ),
//             ListTile(
//               title: Text('Sign Out'),
//               onTap: () {
//                 context.router.replace(LoginRoute());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
