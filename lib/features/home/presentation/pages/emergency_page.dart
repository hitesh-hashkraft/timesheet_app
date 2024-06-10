import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Are you in an emergency?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Press the select the helpline, your live location will be shared with the nearest help centre.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(32),
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  children: [
                    IconButton(
                      iconSize: 80,
                      icon: const Column(
                        children: [
                          Icon(Icons.local_police, size: 50),
                          Text("Police"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 80,
                      icon: const Column(
                        children: [
                          Icon(Icons.fireplace, size: 50),
                          Text("Fire"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 80,
                      icon: const Column(
                        children: [
                          Icon(Icons.help, size: 50),
                          Text("24/7"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 80,
                      icon: const Column(
                        children: [
                          Icon(Icons.local_hospital, size: 50),
                          Text("Medical"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Lock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue[800],
      ),
    );
  }
}