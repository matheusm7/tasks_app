import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 76, 33, 114),
      title: Center(
      child: Text('Lista de tarefas')
      ),
      ),
body: Container(
              padding: EdgeInsets.all(24),
              child: Column(
              children: [
              TextField(
              controller: _textEditingController,
            ),
      Container(
       height: 400,
       child: ListView.separated(
       separatorBuilder: (context, index) => Divider(),
       itemCount: tarefas.length,
       itemBuilder: (context, index) {
       return ListTile(
       title: Text(tarefas[index]),
       onLongPress: () {
       setState(() {
       tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 76, 33, 114),
            onPressed: () {
            if(_textEditingController.text.length > 0) {
            setState(() {
            tarefas.add(_textEditingController.text);
            });
            _textEditingController.clear();
            }
            print(tarefas);
            },
            child: Icon(Icons.add),
                ),
                FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 76, 33, 114),
                onPressed: () {
                setState(() {
                tarefas = [];
                });
                _textEditingController.clear();
                },
                child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}