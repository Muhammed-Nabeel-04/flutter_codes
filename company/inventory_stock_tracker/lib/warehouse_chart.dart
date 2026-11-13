import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/products_data.dart';
import 'package:inventory_stock_tracker/products_model.dart';

class WarehouseChart extends StatelessWidget {
  final bool isTablet;
  const new({super.key,
  required this.isTablet
  });

  @override
  Widget build(BuildContext context) {
    final mainsValue = allProductItems
        .where((items) => items.warehouse == Warehouse.main)
        .fold(0.0, (sum, value) => sum + value.stockValue);

    final southsValue = allProductItems
        .where((items) => items.warehouse == Warehouse.south)
        .fold(0.0, (sum, value) => sum + value.stockValue);

    final northsValue = allProductItems
        .where((items) => items.warehouse == Warehouse.north)
        .fold(0.0, (sum, value) => sum + value.stockValue);

    final maxValue = [
      mainsValue,
      southsValue,
      northsValue,
    ].reduce((a, b) => a > b ? a : b);

    return Container(
      height: isTablet ? 500 : 200,
      padding: EdgeInsets.all(10),

      child: BarChart(
        BarChartData(
          maxY: maxValue == 0 ? 1 : (maxValue * 1.2),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: mainsValue,
                  color: Colors.blue,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),

            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: southsValue,
                  color: Colors.red,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: northsValue,
                  color: Colors.green,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  String title;

                  switch (value){
                    case 0:
                    title = "Main";
                    break;

                    case 1 :
                    title = "South";
                    break;

                    case 2:
                    title = "North";
                    break;

                    default:
                    title = '';
                  }
                  return SideTitleWidget( meta: meta, child: Text(title));
                },
              )
            )
          ),
          
        ),
      ),
    );
  }
}
