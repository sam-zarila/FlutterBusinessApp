import 'package:business/pages/Admin.Login.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'Services',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'MarketPlace',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
<<<<<<< HEAD
    AdminLogin(), // The login page should be displayed here when "Admin" is selected.
=======
    const Center(
      child: Text(
        'Admin Dashboard',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'Admin',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    )
>>>>>>> 77eced41a45c68208f00e00c76e8f562c33908bf
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
<<<<<<< HEAD
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.blue),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.blue),
            label: 'MarketPlace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'Admin',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
=======
            icon: Icon(Icons.home, color: Colors.green,),
            label: 'Home'
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services, color: Colors.green,),
            label: 'Services'
        
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.green,),
            label: 'MarketPlace'
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green,),
            label: 'Admin'
            
            )
        ] ,
         currentIndex: _selectedIndex,
         selectedItemColor: Colors.green,
         onTap: _onItemTapped,

        ),
>>>>>>> 77eced41a45c68208f00e00c76e8f562c33908bf
    );
  }
}
