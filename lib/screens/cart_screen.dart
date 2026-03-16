import 'package:flutter/material.dart';
import '../data/cart_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Toplam fiyatı hesaplama
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return ListTile(
                        leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('\$${product.price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // setState ile sildiğimizde ekranın anında güncellenmesini sağlıyoruz
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Alt kısımdaki toplam fiyat ve ödeme butonu
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Checkout başarılı!')),
                          );
                          setState(() {
                            cartItems.clear(); // Ödeme sonrası sepeti boşalt
                          });
                        },
                        child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
