import 'package:inventory_stock_tracker/products_model.dart';

List<ProductsModel> allProductItems = [
  ProductsModel(
    productName: "Mouse",
    sku: 'BAA-001',
    quantity: 25,
    uinitPrice: 599,
    warehouse: Warehouse.main,
    recevedDate: DateTime(2026, 11, 01)
  ),

  ProductsModel(
    productName: 'Monitor',
    sku: 'MOO-002',
    quantity: 12,
    uinitPrice: 1050,
    warehouse: Warehouse.south,
    recevedDate: DateTime(2026, 10, 01)
  ),

  ProductsModel(
    productName: 'Keyboard',
    sku: 'FSS-006',
    quantity: 18,
    uinitPrice: 750,
    warehouse: Warehouse.north,
    recevedDate: DateTime(2025, 05, 05)
  ),

  ProductsModel(
    productName: 'Cable',
    sku: 'CFD-008',
    quantity: 58,
    uinitPrice: 150,
    warehouse: Warehouse.main,
    recevedDate: DateTime(2026, 02, 08)
  ),
];
