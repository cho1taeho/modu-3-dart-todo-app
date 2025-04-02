import 'dart:io';

import 'package:todo_app/data_source/impl/todo_data_source_impl.dart';
import 'package:todo_app/repository/impl/todo_repository_impl.dart';

import 'data_source/local/todo_data_source.dart';

void main() async {
  final filePath = r'lib/data/';

  final TodoDataSource todoDataSource = TodoDataSourceImpl(
    filePath: filePath + 'todos.json',
  );
  final todoRepository = TodoRepositoryImpl(todoDataSource);

  while (true) {
    print('===== 일 목록 보기 =====');
    print('1. 목록 보기');
    print('2. 할 일 추가');
    print('3. 할 일 수정');
    print('4. 완료 상태 토글');
    print('5. 할 일 삭제');
    print('0. 종료');
    print('======================');

    stdout.write('선택하세요: ');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        final todos = await todoRepository.getTodos();
        print(todos);  // 이쁘게 보이게 수정 메서드 작성
        break;
      case '2':
        break;
      case '3':
        break;
      case '4':
        break;
      case '5':
        break;
      case '0':
        break;
    }
  }
}
