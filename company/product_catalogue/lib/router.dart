import 'package:go_router/go_router.dart';
import 'package:product_catalogue/category_screen.dart';
import 'package:product_catalogue/product_details_screen.dart';
import 'package:product_catalogue/product_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', 
  builder: (context, state) => CategoryScreen()),
  
  GoRoute(path: '/category/:name',
  builder: (context, state) => ProductListScreen(category: state.pathParameters['name']!,)),

  GoRoute(path: '/product/:id',
  builder: (context, state) => ProductDetailsScreen(id: state.pathParameters['id']!,))
  ],
);
