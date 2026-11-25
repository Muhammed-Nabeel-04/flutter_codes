import 'package:go_router/go_router.dart';
import 'package:product_catalogue/pages/drawer_filter.dart';
// import 'package:product_catalogue/filter_screen.dart';
import 'package:product_catalogue/naviation/navigation.dart';
import 'package:product_catalogue/pages/product_details_screen.dart';
import 'package:product_catalogue/pages/product_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/',
  builder: (context, state) => Navigation()),
  
  GoRoute(path: '/category/:name',
  builder: (context, state) => ProductListScreen(category: state.pathParameters['name']!,)),
  
  GoRoute(path: '/product/:id',
  builder: (context, state) => ProductDetailsScreen(id: state.pathParameters['id']!,)),

  GoRoute(path: '/filters',
  builder: (context, state) => DrawerFilter(category: state.extra as String,),
  ),
  ],
);
