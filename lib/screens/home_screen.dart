import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // Verilerimizi import ettik
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
         IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              // Sepet sayfasına geçiş yapıyoruz
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Arama Çubuğu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search products',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. Banner Görseli
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://wantapi.com/assets/banner.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue[50],
                    child: const Center(child: Text('GIFT STORE BANNER', style: TextStyle(fontWeight: FontWeight.bold))),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 3. Başlık
            const Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 4. GridView ile Dinamik Ürün Listesi
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Yan yana 2 ürün
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // Kartın en/boy oranı
                ),
                itemCount: dummyProducts.length, // Veri sayımız kadar kart oluşturur
                itemBuilder: (context, index) {
                  final product = dummyProducts[index]; // O anki ürünü seçiyoruz
                  
                  return GestureDetector(
                    onTap: () {
                      // Navigator ile diğer sayfaya geçiş ve veri (product) taşıma
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ürün Görseli
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.network(
                                product.imageUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Ürün İsim ve Fiyat Bilgisi
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1, // Uzun isimleri tek satırda tutar
                                  overflow: TextOverflow.ellipsis, // Sığmazsa sonuna "..." koyar
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}