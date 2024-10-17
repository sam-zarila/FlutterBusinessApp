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
        'Home',
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
            icon: Icon(Icons.home, color: Colors.blue,),
            label: 'Home'
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.blue,),
            label: 'Services'
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.blue,),
            label: 'MarketPlace'
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue,),
            label: 'Admin'
            
            )
        ] ,
         currentIndex: _selectedIndex,
         selectedItemColor: Colors.blue,
         onTap: _onItemTapped,

        ),
    );
  }
}
