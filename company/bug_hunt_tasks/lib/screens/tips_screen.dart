import 'package:flutter/material.dart';

import '../services/tips_service.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final _service = TipsService();
  late final List<String> _tips = _service.allTips();
  int _index = 0;

  void _nextTip() {
    setState(() => _index++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_service.tipCountLabel())),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            _tips[_index],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _nextTip,
        label: const Text('Next tip'),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
