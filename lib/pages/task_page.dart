import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task.dart';
import 'package:trilhaapp/repositories/task_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var _tasks = <Tarefa>[];
  var descricaoController = TextEditingController();
  var notCompleted = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    if (notCompleted) {
      _tasks = await tarefaRepository.listNotCompleted();
    } else {
      _tasks = await tarefaRepository.list();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoController.text = '';
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text('Adicionar Tarefa'),
                content: TextField(
                  controller: descricaoController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar')
                  ),
                  TextButton(
                    onPressed: () async {
                      await tarefaRepository.create(Tarefa(descricaoController.text, false));
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Salvar'))
                ],
              );
            }
          );
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Exibir apenas não concluídas', style: TextStyle(fontSize: 18)),
                  Switch(
                    value: notCompleted,
                    onChanged: (bool value) {
                      notCompleted = value;
                      getTasks();
                      setState(() {});
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tasks[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await tarefaRepository.remove(tarefa.id);
                      getTasks();
                    },
                    key: Key(tarefa.id),
                    child: ListTile(title: Text(tarefa.description),
                    trailing: Switch(
                      onChanged: (bool value) async {
                        await tarefaRepository.update(tarefa.id, value);
                        getTasks();
                      },
                      value: tarefa.complete)
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}