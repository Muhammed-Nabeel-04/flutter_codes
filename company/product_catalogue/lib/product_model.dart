class ProductModel {
  final int id;
  final String name, category, brand;
  final double price;
  final int stock;
  final Map<String, dynamic> specifications;
  final int offer;
  final String imagePath;
  bool wished;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.stock,
    required this.specifications,
    required this.offer,
    required this.imagePath,
    required this.wished,
  });
}

class FilterModel {
  bool stockFilterWidget;
  double priceRangeWidget;
  String? brandfilterWidget;

  FilterModel({
     this.stockFilterWidget = false,
     this.priceRangeWidget = 1000,
    this.brandfilterWidget,
  });
}

// final FilterModel filterdetails = FilterModel();




final products = [
  ProductModel(
    id: 1,
    name: 'headphones',
    category: 'Electronics',
    brand: 'Sony',
    price: 200,
    stock: 5,
    specifications: {
      'latency': '40 ms',
      'type': 'wireless',
      'battery': '500 mah',
    },
    offer: 50,
    imagePath: 'assets/images/Headphone.avif',
    wished: true,
  ),
  ProductModel(
    id: 2,
    name: 'Lamp',
    category: 'Electronics',
    brand: 'LG',
    price: 40,
    stock: 3,
    specifications: {'bulb': 'Led', 'type': 'wireless', 'battery': '500 mah'},
    offer: 20,
    imagePath: 'assets/images/Lamp.avif',
    wished: false,
  ),
  ProductModel(
    id: 3,
    name: 'Bed',
    category: 'Furniture',
    brand: 'Apex',
    price: 60,
    stock: 9,
    specifications: {'size': 'Large', 'type': 'leather', 'meterial': 'cotton'},
    offer: 70,
    imagePath: 'assets/images/Bed.jpg',
    wished: false,
  ),
  ProductModel(
    id: 4,
    name: 'Table',
    brand: "Toyota",
    category: 'Furniture',
    price: 599,
    stock: 4,
    specifications: {'meterial': 'Wood', "height": 30, 'Shape': "Square"},
    offer: 10,
    imagePath: 'assets/images/Table.avif',
    wished: false,
  ),
  ProductModel(
    id: 5,
    name: 'charger',
    category: 'Electronics',
    brand: 'Realme',
    price: 1500,
    stock: 0,
    specifications: {
      'Power': '18 W',
      'type': 'Type A - Type C',
      'Technology': 'QC3.0',
    },
    offer: 30,
    imagePath: 'assets/images/Charger.jpg',
    wished: true,
  ),
];
