import 'package:leave_request/data_model.dart';
import 'package:material_ui/material_ui.dart';

class FormFillProvider extends ChangeNotifier {
  String? leaveType;
  DateTimeRange? dateRange;
  TextEditingController controller = TextEditingController();

  Future<void> datepicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDateRange: dateRange,
    );

    if (picked != null) {
      dateRange = picked;
    }
    notifyListeners();
  }

  bool halfDay = false;

  void toogleDay(bool value) {
    halfDay = value;
    notifyListeners();
  }

  double countLeaveDays(DateTimeRange dateRange, bool halfDay) {
    int days = 0;
  
    for (
      var d = dateRange.start;
      !d.isAfter(dateRange.end);
      d = DateTime(d.year, d.month, d.day + 1)
    ) {
      if (d.weekday != DateTime.saturday && d.weekday != DateTime.sunday) {
        days++;
      }
    }
    // if (halfDay) return days/2;
    if(halfDay && days == 1) return 0.5;
    return days.toDouble();
  }

  DataModel apply() {
    return DataModel(
      leaveType: leaveType!,
      date: dateRange!,
      halfDay: halfDay,
      reason: controller.text.trim(),
      numberOfDays: countLeaveDays(dateRange!, halfDay),
    );
  }

  void reset() {
    leaveType = null;
    dateRange = null;
    controller.clear();
    halfDay = false;
  }

  void resetButton() {
    reset();
    notifyListeners();
  }

  void initstate(DataModel? input) {
    if (input == null) {
      reset();
      return;
    }

    leaveType = input.leaveType;
    dateRange = input.date;
    controller.text = input.reason;
    halfDay = input.halfDay;
  }
}
