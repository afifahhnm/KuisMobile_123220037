import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civitas'),
        backgroundColor: const Color.fromARGB(255, 129, 255, 161),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildMenuCard(context, '123210131', 'Hari Ini Mokel Ga ya??'),
          _buildMenuCard(context, '123210131', 'Kok UKT MAHAL BANGET SIH?'),
          _buildMenuCard(context, '123210000', 'UKT ELIT FASILITAS SULIT'),
          _buildMenuCard(context, '123210000', 'IF 98 NIM 10 KOK CAKEP BANGET, Single GA YA???'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 58, 255, 104),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String nim, String text) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          nim,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(text),
        trailing: const Icon(Icons.bookmark_border),
      ),
    );
  }
}
