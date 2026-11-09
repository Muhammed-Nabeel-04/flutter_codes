import 'dart:convert';

const _tipsJson = '''
{
  "count": 3,
  "tips": [
    "Read the first line of the error, then find your own file in the stack trace.",
    "Use the Widget Inspector and Layout Explorer for layout problems.",
    "Set a breakpoint and inspect variables instead of guessing."
  ]
}
''';

class TipsService {
  Future<String> loadTip() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return 'Tip: hot reload keeps state, hot restart resets it.';
  }

  String tipCountLabel() {
    final Map<String, dynamic> data = jsonDecode(_tipsJson);
    final count = data['count'] as int;
    return '$count tips available';
  }

  List<String> allTips() {
    final Map<String, dynamic> data = jsonDecode(_tipsJson);
    return List<String>.from(data['tips']);
  }
}

