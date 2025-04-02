import 'dart:convert';
import 'dart:io';

import 'package:todo_app/data_source/local/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {

  final String filePath;

  TodoDataSourceImpl({required this.filePath});

  @override
  Future<List<Map<String, dynamic>>> readTodos() {

  }

  @override
  Future<void> writeTodos(List<Map<String, dynamic>> todos) async {

    final File file = File(filePath);
    final jsonString = jsonEncode(todos);
    await file.writeAsString(jsonString);




  }
  
  
}