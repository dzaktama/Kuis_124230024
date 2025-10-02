import 'package:flutter/material.dart';
import 'dummy_menu.dart'; 
import 'halaman_detail.dart'; 
import 'halaman_login.dart'; 

// class halamanutama ini buat nampilin daftar menu setelah user login
class HalamanUtama extends StatefulWidget {
  final String username;

  const HalamanUtama({super.key, required this.username});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {

  // fungsi ini buat balik ke halaman login (logout)
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HalamanLogin()),
    );
  }

  // fungsi build ini yang nampilin semua ui-nya
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('selamat datang, ${widget.username}!'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final FoodMenu menu = foodMenuList[index];
                // listtile ini widget bawaan buat nampilin item di list
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: Image.network(
                      menu.imageUrls[0],
                      width: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(width: 80, child: Icon(Icons.restaurant_menu));
                      },
                    ),
                    title: Text(menu.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${menu.category}\n${menu.price}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      // fitur utama: navigasi ke halaman detail buat dapet feedback snackbar
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanDetail(menu: menu),
                        ),
                      );
                      // 
                      // kalo ada hasil dari halaman detail, tampilkan snackbar
                      if (result != null && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('berhasil membeli $result'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}