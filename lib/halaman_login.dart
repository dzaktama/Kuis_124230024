import 'package:flutter/material.dart';
import 'halaman_utama.dart';

// class halamanlogin ini buat ngurusin tampilan dan fungsi di halaman login
class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // fungsi utama buat validasi login, ngecek password sama dengan 3 digit terakhir nim
  void _login() {
    const String usernameBenar = 'dzaky';
    const String passwordBenar = '024';
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'dzaky' && password == passwordBenar) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanUtama(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('username salah dan password harus 3 digit terakhir nim'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // fungsi build ini yang nampilin semua ui di halaman login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.restaurant_menu, size: 80, color: Colors.orange),
              const SizedBox(height: 16),
              const Text(
                'Food Menu App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
