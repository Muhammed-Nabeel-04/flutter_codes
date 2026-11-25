import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalogue/widgets/grid_view_widget.dart';

class CategoryScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  List<String> categories = [
    'Electronics',
    'Furniture',
    'Stationery',
    'Apparel',
  ];

  late final AnimationController _controllere;

  @override
  void initState() {
    super.initState();
    _controllere = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    // print('disoseddddddddddddd');
    _controllere.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Catalogue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children:


           List.generate(categories.length, (i) {
            final step = 0.1;
            final fade = CurvedAnimation(
              parent: _controllere,
              curve: Interval(
                // 0.1, 0.7
                i * step,
                i * step + 0.5,
                curve: Curves.easeIn,
              ),
            );
            
            return FadeTransition(
              opacity: fade,
              child: categoriesWidget(
                categories[i],
                () => context.push('/category/${categories[i]}')
              ),
            );
          }),

          // categories
          //     .map((c) => categoriesWidget(c, ()=> context.push('/category/$c')))
          //     .toList(),
        ),
      ),
    );
  }
}
