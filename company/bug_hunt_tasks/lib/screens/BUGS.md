Bug 1:

 # type 'int' is not a subtype of type 'String" is type cast
 
 String tipCountLabel() {
    final Map<String, dynamic> data = jsonDecode(_tipsJson);
    final count = data['count'] as int;
    return '$count tips available';
  }



------------------------------------------------------------------------------------------

Bug 2:

# used Wrap intead of row() to avoid overflow.

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




------------------------------------------------------------------------------------------

Bug 3:

# missing assets in pubspec.yamal.

  assets:
   - assets/images/ 




------------------------------------------------------------------------------------------

Bug 4:

# added the listviewbuilder inside expanded(), so it can take retuired space to scroll.


Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (ctx, index) {
                  final task = _tasks[index];
                  return TaskTile(
                    task: task,
                    onChanged: (value) => setState(() => task.done = value),
                    onDelete: () => setState(() => _tasks.removeAt(index)),
                    onTap: () => _openDetails(task),
                  );
                },
              ),
            ),







------------------------------------------------------------------------------------------

Bug 5:

# (open last view) button in home screen error if clicked due to _lastviewed is null, so added a if condion to check.


 void _openLastViewed() {
    if (_lastViewed == null){
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: _lastViewed!)),
    );
  }




------------------------------------------------------------------------------------------

Bug 6: 

# error if _tasks doesnt contain value for  Note: , so added a if condition to check value null or !null.


Text('Note: ${widget.task.note == null ? 'null'  : widget.task.note!.toUpperCase()}'),




------------------------------------------------------------------------------------------

Bug 7: 

# added an if condition to the _index++ in tips screen.dart to avoid range error.

  void _nextTip() {
    if (_index < _tips.length-1){ 
    setState(() => _index++);}
  }





------------------------------------------------------------------------------------------

Bug 8:

# Future object returns "future<String" instead of actual tip message.

Future<void> _showTip() async {
    final tip = await _tipsService.loadTip();
    setState(() {
      _status = tip;
    });
  }





------------------------------------------------------------------------------------------

Bug 9:

# added texteditiing controller.clear() for add button. to clear the add new task text field. 


FilledButton(
            onPressed: () {
              setState(() {
                _tasks.add(Task(title: _titleController.text));
                _titleController.clear();
              });
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),






------------------------------------------------------------------------------------------

Bug 10:

# added texteditiing controller.clear() for cancel button. to clear the add new task text field. 



TextButton(
            onPressed: () { setState(() {
              _titleController.clear();
            }); Navigator.pop(ctx);},
            child: const Text('Cancel'),
            
          ),








------------------------------------------------------------------------------------------

Bug 11:

# added setstate to the _clearCompleted() function due to clear complted button dosent chnage the UI.


void _clearCompleted() {
    setState(() {
          _tasks.removeWhere((t) => t.done);
    });
  }




------------------------------------------------------------------------------------------

Bug 12:

# the checkbox automatically true for next listtile if one deleted. so added key : valuekey(task.title). 



Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (ctx, index) {
                final task = _tasks[index];
                return TaskTile(
                  key: ValueKey(task.title),
                  task: task,
                  onChanged: (value) => setState(() => task.done = value),
                  onDelete: () => setState(() => _tasks.removeAt(index)),
                  onTap: () => _openDetails(task),
                );
              },
            ),
          ),





------------------------------------------------------------------------------------------

Bug 13:


# the add new task textfiled adds task even it is empty. solved by adding an if condition to check if it is empty.

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






------------------------------------------------------------------------------------------

Bug 14:

# calculation error in number of complted and number of remaining tasks because of a ! operator, solved by removing it.

  int get _completedCount => _tasks.where((t) => t.done).length;






------------------------------------------------------------------------------------------

Bug 15:

# added an if condition to the outlined button to remove the onpressed if lastView is null and added setstate for the ontap of the listview builder's _openDetail().


onPressed: _lastViewed != null ? _openLastViewed : null,


  void _openDetails(Task task) {
    setState(() {
        _lastViewed = task;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: task)),
    );
    });
  }





------------------------------------------------------------------------------------------

Bug 16:

# added new variable completedCount to store the length of the number of the _task.done. and in npressed checks whether the compltedCount is != 0;


int get compltedCount => _tasks.where((t) => t.done).length ;

OutlinedButton(
  onPressed: compltedCount != 0 ? _clearCompleted : null,
      child: const Text('Clear completed'),
          ),





------------------------------------------------------------------------------------------

