import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notehub_app/presentation/notes/notes_page.dart';
import 'package:notehub_app/presentation/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMenu = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NotesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Home page'),
      //       OutlinedButton(
      //         onPressed: () async {
      //           await FirebaseAuth.instance.signOut();
      //         },
      //         child: Text('Logout'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(child: _widgetOptions.elementAt(_selectedMenu)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_sharp),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedMenu,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
