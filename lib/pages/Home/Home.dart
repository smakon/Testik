import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Home')),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
            child: Text('Signup'),
          ),
        ],
      ),
    );
  }
}
