import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/tips_service.dart';
import '../widgets/task_tile.dart';
import 'task_details_screen.dart';
import 'tips_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [
    Task(
        title: 'Install Flutter',
        done: true,
        note: 'flutter doctor should be green'),
    Task(title: 'Build the Roll Dice app'),
    Task(title: 'Build the Quiz app', note: 'Use map() for the answer buttons'),
    Task(title: 'Read about widget keys'),
  ];
  final _titleController = TextEditingController();
  final _tipsService = TipsService();
  Task? _lastViewed;
  String _status = '';

  int get _completedCount => _tasks.where((t) => t.done).length;

  void _addTask() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New task'),
        content: TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _titleController.clear();
              });
              Navigator.pop(ctx);
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                if (_titleController.text.trim().isNotEmpty){
                _tasks.add(Task(title: _titleController.text));
                _titleController.clear();}
              });
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _clearCompleted() {
    setState(() {
          _tasks.removeWhere((t) => t.done);
    });
  }

  void _openDetails(Task task) {
    setState(() {
        _lastViewed = task;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: task)),
    );
    });
  }

  void _openLastViewed() {
    if (_lastViewed == null) {
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: _lastViewed!)),
    );
  }

  Future<void> _showTip() async {
    final tip = await _tipsService.loadTip();
    setState(() {
      _status = tip;
    });



    
  }

  int get compltedCount => _tasks.where((t) => t.done).length ;

  @override
  Widget build(BuildContext context) {
    if (_tasks.isEmpty) {
      setState(() {
        _status = 'All tasks cleared!';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bug Hunt Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            tooltip: 'Tips',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const TipsScreen()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            'assets/images/logo.png',
            height: 80,
            width: 80,
          )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              children: [
                const Icon(Icons.bug_report, size: 32),
                const SizedBox(width: 8),
                Text(
                  'Welcome to the Flutter debugging practice app — find and fix every bug before the deadline',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Icon(Icons.timer_outlined),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Completed: $_completedCount of ${_tasks.length}'),
          ),
          if (_status.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(_status),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton(
                  onPressed: compltedCount != 0 ? _clearCompleted : null,
                  child: const Text('Clear completed'),
                ),
                OutlinedButton(
                  onPressed: _lastViewed != null ? _openLastViewed : null,
                  child: const Text('Open last viewed'),
                ),
                OutlinedButton(
                  onPressed: _status.isEmpty ? _showTip : null,
                  child: const Text('Show tip'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (ctx, index) {
                final task = _tasks[index];
                return TaskTile(
                  key: ValueKey("ansaf"),
                  task: task,
                  onChanged: (value) => setState(() => task.done = value),
                  onDelete: () => setState(() => _tasks.removeAt(index)),
                  onTap: () => _openDetails(task),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
