import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
    required this.onTap,
  });

  final Task task;
  final ValueChanged<bool> onChanged;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late bool _done = widget.task.done;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _done,
        onChanged: (value) {
          setState(() => _done = value ?? false);
          widget.onChanged(_done);
        },
      ),
      title: Text(
        widget.task.title,
        style: TextStyle(
          decoration: _done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: widget.onDelete,
      ),
      onTap: widget.onTap,
    );
  }
}
