import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_data.dart';

class ProductDetailScreen extends StatelessWidget {
  // Bu sayfa açılırken mutlaka bir ürün bilgisi (product) almalı
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // Geri butonu rengi
        title: Text(
          product.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Ürün Görseli
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          
          const SizedBox(height: 20),

          // 2. Ürün Bilgileri (İsim, Fiyat, Açıklama)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                ),
              ],
            ),
          ),

          const Spacer(), // Geri kalan boşluğu doldurup butonu en alta iter

          // 3. Sepete Ekle Butonu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Sepete ekleme işlemi (Bir sonraki adım)
                 // Ürünü global listeye ekliyoruz
                  cartItems.add(product);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} sepete eklendi!')),
                  );
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}