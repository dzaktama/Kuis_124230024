import 'package:flutter/material.dart';
import 'dummy_menu.dart';

// class halamandetail ini nampilin semua info lengkap menu dan punya fitur beli
class HalamanDetail extends StatefulWidget {
  final FoodMenu menu;

  const HalamanDetail({super.key, required this.menu});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  Color _buttonColor = Colors.orange;

  // fungsi build ini yang nampilin semua ui di halaman detail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.menu.imageUrls[0],
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                    height: 250,
                    child: Icon(Icons.restaurant_menu, size: 100));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // nampilin nama menu sama waktu masaknya
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.menu.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      // ini buat nampilin icon timer sama teks waktunya
                      Row(
                        children: [
                          const Icon(Icons.timer, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(widget.menu.cookingTime,
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                  // nampilin kategori menu pake icon
                  Row(
                    children: [
                      const Icon(Icons.restaurant,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(widget.menu.category,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(widget.menu.price,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  // buat judul 'deskripsi' sama iconnya
                  const Row(
                    children: [
                      Icon(Icons.description),
                      SizedBox(width: 8),
                      Text('Deskripsi:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(widget.menu.description),
                  const SizedBox(height: 16),
                  //  judul 'bahan-bahan' plus iconnya
                  const Row(
                    children: [
                      Icon(Icons.list_alt),
                      SizedBox(width: 8),
                      Text('Bahan-bahan:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(widget.menu.ingredients),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomnavigationbar buat naruh tombol beli di bawah
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: _buttonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          // fitur utama: tombol beli yang pas diklik berubah warna dan balik sambil ngasih snackbar
          onPressed: () {
            setState(() {
              _buttonColor = Colors.green;
            });
            // pake future.delayed biar user sempet liat tombolnya ganti warna
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pop(context, widget.menu.name);
            });
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Pesan Sekarang'),
        ),
      ),
    );
  }
}