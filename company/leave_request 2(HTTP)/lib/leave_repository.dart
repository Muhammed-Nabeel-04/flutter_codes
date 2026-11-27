import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:leave_request/data_model.dart';

class LeaveRepository {
  static const base = 'https://leaverequest-9974a-default-rtdb.firebaseio.com';

  Future<List<DataModel>> fetchRequests() async{
    final res = await http.get(Uri.parse('$base/leaves.json'));
    if (res.statusCode != 200) throw Exception('Failed to load');

    final body = jsonDecode(res.body);
    if (body == null) return [];

    final map = body as Map<String, dynamic>;
    return map.entries.map((e)=> DataModel.fromJson(e.key, e.value as Map<String, dynamic>)).toList();
  }

  Future<String> addRequest(DataModel m)async {
    final res = await http.post(Uri.parse('$base/leaves.json'),
    body: jsonEncode(m.toJason())
    );
    if (res.statusCode != 200) throw Exception('Failer to save');
    return jsonDecode(res.body)['name'];
  }
}
