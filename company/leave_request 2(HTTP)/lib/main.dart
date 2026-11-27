import 'package:leave_request/form_fill_provider.dart';
import 'package:leave_request/form_list_provider.dart';
import 'package:leave_request/router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FormFillProvider()),
      ChangeNotifierProvider(create: (_) => FormListProvider())
    ],    
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      // home: FormFillScreen(),
      routerConfig: router,
    );
  }
}
