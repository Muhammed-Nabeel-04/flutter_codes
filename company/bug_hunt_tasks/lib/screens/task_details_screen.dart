import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Task task;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  String _history = 'Loading history...';

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _history = 'Created today · edited 2 times';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${widget.task.done ? 'Done' : 'Pending'}'),
            const SizedBox(height: 8),
            Text('Note: ${widget.task.note == null ? 'null'  : widget.task.note!.toUpperCase()}'),
            const SizedBox(height: 8),
            Text(_history),
          ],
        ),
      ),
    );
  }
}
