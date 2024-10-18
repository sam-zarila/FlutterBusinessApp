import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
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
    );
  }
}
