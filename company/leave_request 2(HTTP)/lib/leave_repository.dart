import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:leave_request/data_model.dart';

class LeaveRepository {
  static const base = 'https://leaverequest-9974a-default-rtdb.firebaseio.com';

  Future<List<DataModel>> fetchRequests() async{
    final response = await http.get(Uri.parse('$base/leaves.json'));
    if (response.statusCode != 200) throw Exception('Failed to load');

    final body = jsonDecode(response.body) ;
    if (body == null) return [];

    final map = body as Map<String, dynamic>;
    return map.entries.map((e)=> DataModel.fromJson(e.key, e.value as Map<String, dynamic>)).toList();
  }

  Future<void> addRequest(DataModel m)async {
    final response = await http.post(Uri.parse('$base/leaves.json'),
    body: jsonEncode(m.toJason())
    );
    if (response.statusCode != 200) throw Exception('Failed to save');
    // return jsonDecode(response.body)['name'];
  }

    Future<void> updateStatus(String id, String status) async{
      final response = await http.patch(
        Uri.parse('$base/leaves/$id.jason'),
        
      );
    }



}
