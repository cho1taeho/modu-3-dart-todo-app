
import 'package:todo_app/data_source/impl/todo_data_source_impl.dart';
import 'package:todo_app/repository/impl/todo_repository_impl.dart';

import 'data_source/local/todo_data_source.dart';

void main() async {
  final filePath = r'lib/data/';

  final TodoDataSource todoDataSource = TodoDataSourceImpl(filePath: filePath + 'todos.json');
  final todoRepository = TodoRepositoryImpl(todoDataSource);
  final todo = await todoRepository.getTodos();



  print(todo);
}