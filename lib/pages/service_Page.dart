import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Services here'
        ),

      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
