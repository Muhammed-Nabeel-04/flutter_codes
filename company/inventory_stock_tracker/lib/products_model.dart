import 'package:uuid/uuid.dart';

class ProductsModel{
  final String id;
  final String productName;
  final String sku;
  final int quantity;
  final double uinitPrice;
  final Warehouse warehouse; 
  final DateTime recevedDate;

  ProductsModel({
    String? id,
    required this.productName,
    required this.sku,
    required this.quantity,
    required this.uinitPrice,
    required this.warehouse,
    required this.recevedDate
  }): id = id ?? const Uuid().v4();

  double get stockValue => quantity*uinitPrice;
}

enum Warehouse{
  main,
  north, 
  south
  
}


