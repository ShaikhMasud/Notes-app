import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late DatabaseHelper _dbHelper;
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
    _refreshTodoList();
  }

  Future<void> _refreshTodoList() async {
    final data = await _dbHelper.queryAll();
    setState(() {
      _todos = data.map((item) => Todo.fromMap(item)).toList();
    });
  }

  void _showForm(int? id) async {
    String title = '';
    String description = '';

    if (id != null) {
      final existingTodo = _todos.firstWhere((element) => element.id == id);
      title = existingTodo.title;
      description = existingTodo.description;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(id == null ? 'Add Note' : 'Update Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: title),
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: description),
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _dbHelper.insert({
                    'title': title,
                    'description': description,
                  });
                } else {
                  await _dbHelper.update({
                    'id': id,
                    'title': title,
                    'description': description,
                  });
                }
                Navigator.of(context).pop();
                _refreshTodoList();
              },
              child: Text(id == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter To-Do App'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await _dbHelper.delete(todo.id!);
                  _refreshTodoList();
                },
              ),
              onTap: () => _showForm(todo.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
