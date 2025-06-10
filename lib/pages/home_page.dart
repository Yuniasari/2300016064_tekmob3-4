import 'package:flutter/material.dart';
import '../data/dummy_products.dart';
import '../models/product.dart';
import 'detail_page.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatRupiah(double price) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return format.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Elektronik'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,           // Jumlah kolom
          mainAxisSpacing: 10,         // Spasi antar baris
          crossAxisSpacing: 10,        // Spasi antar kolom
          childAspectRatio: 2.5 / 3,   // Ukuran kotak (lebih kecil)
        ),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final Product product = dummyProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(product: product),
                ),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.devices_other, size: 40, color: Colors.grey),
                    Text(
                      product.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      formatRupiah(product.price),
                      style: const TextStyle(color: Colors.green, fontSize: 13),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        Text('${product.rating}', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
