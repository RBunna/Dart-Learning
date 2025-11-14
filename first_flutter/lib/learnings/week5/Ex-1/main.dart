import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                text: 'Traveling',
                color: Colors.green,
                icon: Icons.travel_explore,
              ),
              SizedBox(height: 10),
              HobbyCard(
                text: 'Skating',
                color: Colors.blueGrey,
                icon: Icons.skateboarding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const HobbyCard({
    super.key,
    required this.text,
    required this.icon,
    this.color = Colors.blue,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(icon, size: 24.0, color: Colors.white),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
