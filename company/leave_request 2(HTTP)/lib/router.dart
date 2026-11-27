import 'package:go_router/go_router.dart';
import 'package:leave_request/data_model.dart';
import 'package:leave_request/form_fill_screen.dart';
import 'package:leave_request/form_list_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) => FormListScreen(),
  ),

  GoRoute(path: '/formfill',
  builder: (context, state) {
   final input = state.extra as DataModel?;
    return FormFillScreen(input: input);} 
  )
]);