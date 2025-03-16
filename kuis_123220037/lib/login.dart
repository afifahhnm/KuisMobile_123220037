import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

 void login() {
  String username = usernameController.text;
  String password = passwordController.text;

  if (username == "admin" && password == "1234") {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Berhasil'),
        content: Text('Selamat datang, $username!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: '',)), 
              );
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  } else {
    setState(() {
      errorMessage = 'Username atau Password salah';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color.fromARGB(255, 183, 255, 184), const Color.fromARGB(255, 59, 124, 49)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified_user, size: 50, color: const Color.fromARGB(255, 56, 156, 38)),
                  SizedBox(height: 10),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildTextField(usernameController, 'User Name', Icons.person),
                  SizedBox(height: 10),
                  _buildTextField(passwordController, 'Password', Icons.lock, isPassword: true),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 85, 32),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.30, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  
                    label: Text('LOGIN ', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(errorMessage, style: TextStyle(color: Colors.red)),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 161, 255, 176)),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}