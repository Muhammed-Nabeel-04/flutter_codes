class ProductModel {
  final int? id;
  final String? name, category, brand;
  final double? price;
  final int? stock;
  final String? specifications;

  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.category,
    this.price,
    this.specifications,
    this.stock,
  });
}

final products = [
  ProductModel(
    id: 1,
    name: 'headphones',
    category: 'Electeronics',
    brand: 'Sony',
    price: 200,
    stock: 5,
  ),
  ProductModel(
    id: 2,
    name: 'Lamp',
    category: 'Electeronics',
    brand: 'LG',
    price: 40,
    stock: 3,
  ),
  ProductModel(
    id: 3,
    name: 'Bed',
    category: 'Furniture',
    brand: 'apex',
    price: 60,
    stock: 9,
  ),
];
