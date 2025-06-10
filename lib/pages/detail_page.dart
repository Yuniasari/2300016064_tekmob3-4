import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                Text(product.rating.toString(), style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            Text(product.description),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartProvider.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ditambahkan ke keranjang!')),
                      );
                    },
                    child: const Text("Tambah ke Keranjang"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      cartProvider.addToCart(product);
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Text("Beli Sekarang"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
