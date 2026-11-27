import 'package:material_ui/material_ui.dart';

class DataModel {
  final String leaveType;
  final DateTimeRange<DateTime> date;
  final bool halfDay;
  final String reason;
  final double? numberOfDays;

  DataModel({
    required this.leaveType,
    required this.date,
    required this.halfDay,
    required this.reason,
    required this.numberOfDays
  });
}


List<DataModel> leaveRequestDetails = [
  DataModel(
    leaveType: 'Casual',
    date: DateTimeRange(
      start: DateTime(2026, 11, 18),
      end: DateTime(2026, 11, 26),
    ),
    halfDay: false,
    reason: 'I am suffering headache',
    numberOfDays: 7
  ),
  DataModel(
    leaveType: 'Sick',
    date: DateTimeRange(
      start: DateTime(2026, 11, 20),
      end: DateTime(2026, 11, 22),
    ),
    halfDay: false,
    reason: 'I am suffering headache',
    numberOfDays: 1
  ),
];

List<String> leaveTypeDropDown = ['Casual', 'Sick', 'Earned'];




enum TypeofLeave{
  casual,
  sick,
  earned
}
