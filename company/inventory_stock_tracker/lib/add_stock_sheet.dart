import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/products_model.dart';

class AddStockSheet extends StatefulWidget {
  const new({super.key});

  @override
  State<AddStockSheet> createState() => _AddStockSheetState();
}

class _AddStockSheetState extends State<AddStockSheet> {
  Warehouse? selectedWarehouse;
  DateTime? selectDate;

  final productController = TextEditingController();
  final skuController = TextEditingController();
  final quantityController = TextEditingController();
  final unitPriceController = TextEditingController();

  void selectRecevedDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectDate = pickedDate;
      });
    }
  }

  void addStock() {
    String name = productController.text.trim();
    String sku = skuController.text.trim();
    int? quantity = int.tryParse(quantityController.text);
    double? price = double.tryParse(unitPriceController.text);

    if (name.isEmpty ||
        sku.isEmpty ||
        quantity == null ||
        quantity <= 0 ||
        price == null ||
        price <= 0 ||
        selectDate == null ||
        selectedWarehouse == null) {
      showDialog(
        context: context,


        builder: (context) => AlertDialog.adaptive( // change 1.
          title: Text('Invalid Input'),
          content: Text('Please eneter valid Product details'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),


        
      );
      return;
    }

    final newProduct = ProductsModel(
      productName: name,
      sku: sku,
      quantity: quantity,
      uinitPrice: price,
      warehouse: selectedWarehouse!,
      recevedDate: selectDate!,
    );
    // allProductItems.add(newProduct);

    Navigator.pop(context, newProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).viewInsets.bottom),
      // padding: EdgeInsetsGeometry.all(10),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          TextField(
            controller: productController,
            decoration: InputDecoration(
              labelText: "Product Name",
              hintText: "Enter product name",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextFormField(
            controller: skuController,
            decoration: InputDecoration(
              labelText: "SKU",
              hintText: "Enter Product SKU",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          DropdownButtonFormField(
            initialValue: selectedWarehouse,
            decoration: InputDecoration(
              labelText: 'Selected Warehouse',
              border: OutlineInputBorder(),
            ),
            hint: Text('Choose warehouse'),
            items: Warehouse.values.map((warehouse) {
              return DropdownMenuItem(
                value: warehouse,
                child: Text(warehouse.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedWarehouse = value;
              });
            },
          ),

          SizedBox(height: 15),

          Row(
            spacing: 15,
            children: [
              Expanded(
                child: TextFormField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Quantity",
                    hintText: "Enter Quantity",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Expanded(
                child: TextFormField(
                  controller: unitPriceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Unit Price",
                    hintText: "Enter Price",
                    prefixText: "₹ ",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),
          InkWell(
            onTap: selectRecevedDate,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: "received Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_month),
              ),
              child: Text(
                selectDate == null
                    ? "Select recieved date"
                    : '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
              ),
            ),
          ),

          SizedBox(height: 15),

          ElevatedButton(
            onPressed: addStock,

            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Text('Add Stock'),
          ),
        ],
      ),
    );
  }
}
