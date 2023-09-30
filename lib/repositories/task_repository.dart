import 'package:trilhaapp/model/task.dart';

class TarefaRepository {
  final List<Tarefa> _tasks = [];

  Future<void> create(Tarefa task) async {
    await Future.delayed(const Duration(microseconds: 1));
    _tasks.add(task);
  }

  Future<void> update(String id, bool complete) async {
    await Future.delayed(const Duration(microseconds: 1));
    _tasks.where((task) => task.id == id).first.complete = complete;
  }

  Future<List<Tarefa>> list() async  {
    await Future.delayed(const Duration(microseconds: 1));
    return _tasks;
  }

  Future<List<Tarefa>> listNotCompleted() async  {
    await Future.delayed(const Duration(microseconds: 1));
    return _tasks.where((task) => !task.complete).toList();
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(microseconds: 1));
    var item = _tasks.where((task) => task.id == id).first;
    _tasks.remove(item);
  }
}