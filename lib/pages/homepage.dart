// pages/home_page.dart
import 'package:flutter/material.dart';


// class HomePage extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   Future<void> _logout(BuildContext context) async {
//     await _authService.logout();
//     Navigator.pushReplacementNamed(context, '/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => _logout(context),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Page!'),
//       ),
//     );
//   }
// }


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home',
        style: TextStyle(fontSize: 24),
        ),
        centerTitle:  true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

           children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16,

                 children: [
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child:  const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.post_add, size: 50,),
                            SizedBox(height: 10,),
                            Text('Post', style: TextStyle(),)
                          ],
                        ),
                        
                        ),
                        
                    ),
                  ),
                   Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child:  const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.list_alt, size: 50,),
                            SizedBox(height: 10,),
                            Text('Orders', style: TextStyle(),)
                          ],
                        ),
                        
                        ),
                        
                    ),
                  )
                 ],
                
                ) )
           ],
        ),
        
        
         ),
        


    );
  }
}
