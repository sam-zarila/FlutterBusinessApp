// pages/home_page.dart
import 'package:flutter/material.dart';
import '../pages/Admin_post.dart';
import '../pages/Admin_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Home',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
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
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostMarket(),
                          ),
                        );
                    
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add,
                            size: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Post',
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context)=> const PostMarket())
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Orders',
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
