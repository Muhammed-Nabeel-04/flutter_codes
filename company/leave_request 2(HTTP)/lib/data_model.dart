import 'package:material_ui/material_ui.dart';

class DataModel {
  final String? id;
  final String leaveType;
  final DateTimeRange<DateTime> date;
  final bool halfDay;
  final String reason;
  // final double? numberOfDays;
  final String? status;

  DataModel({
    this.id,
    required this.leaveType,
    required this.date,
    required this.halfDay,
    required this.reason,
    // required this.numberOfDays,
    this.status,
  });

  Map<String, dynamic> toJason() => {
    'leaveType': leaveType,
    'start': date.start.toIso8601String(),
    'end': date.end.toIso8601String(),
    'halfDay': halfDay,
    'reason': reason,
    'status': status,
  };

  factory DataModel.fromJson(String id, Map<String, dynamic> json) {
    return DataModel(
      id: id,
      leaveType: json['leaveType'] ?? '',
      date: DateTimeRange(
        start: DateTime.parse(json['start']),
        end: DateTime.parse(json['end']),
      ),
      halfDay: json['halfDay'] ?? false,
      reason: json['reason'] ?? '',
      // numberOfDays: numberOfDays
      status: json['status'] ?? 'pending',
    );
  }
}


// List<DataModel> leaveRequestDetails = [
//   DataModel(
//     leaveType: 'Casual',
//     date: DateTimeRange(
//       start: DateTime(2026, 11, 18),
//       end: DateTime(2026, 11, 26),
//     ),
//     halfDay: false,
//     reason: 'I am suffering headache',
//     numberOfDays: 7
//   ),
//   DataModel(
//     leaveType: 'Sick',
//     date: DateTimeRange(
//       start: DateTime(2026, 11, 20),
//       end: DateTime(2026, 11, 22),
//     ),
//     halfDay: false,
//     reason: 'I am suffering headache',
//     numberOfDays: 1
//   ),
// ];

List<String> leaveTypeDropDown = ['Casual', 'Sick', 'Earned'];

// enum TypeofLeave{
//   casual,
//   sick,
//   earned
// }
