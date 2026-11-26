import 'package:material_ui/material_ui.dart';

class FormListProvider extends ChangeNotifier {
  Color textColor(String typeofLeave) {
    if (typeofLeave == "Casual") {
      return Colors.black;
    } else if (typeofLeave == "Sick") {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }
}
