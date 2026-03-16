import '../models/product.dart';

final List<Map<String, dynamic>> mockProductsJson = [
  {
    "id": "1",
    "name": "AirPods Pro (2nd Gen)",
    "description": "Aktif Gürültü Engelleme ve adaptif şeffaflık modu ile mükemmel ses kalitesi.",
    "price": 249.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1660803972361" 
  },
  {
    "id": "2",
    "name": "AirPods Max",
    "description": "Yüksek kaliteli ses deneyimi sunan kulak üstü kulaklık.",
    "price": 549.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-max-select-spacegray-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000"
  },
  {
    "id": "3",
    "name": "HomePod Mini",
    "description": "Küçük boyutuna rağmen inanılmaz derecede büyük bir ses sunar.",
    "price": 99.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-mini-select-spacegray-202010?wid=470&hei=556&fmt=png-alpha&.v=1601503371000"
  },
  {
    "id": "4",
    "name": "iPhone 15 Pro",
    "description": "Titanyum tasarım ve A17 Pro çip ile inanılmaz performans.",
    "price": 999.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1692846360609"
  },
  {
    "id": "5",
    "name": "MacBook Pro 14\"",
    "description": "M3 Pro işlemci ile profesyoneller için tasarlandı.",
    "price": 1999.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp14-spacegray-select-202310?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1697230830200"
  }
];

final List<Product> dummyProducts = mockProductsJson
    .map((json) => Product.fromJson(json))
    .toList();