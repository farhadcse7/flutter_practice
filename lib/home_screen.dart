import 'package:flutter/material.dart';
import 'package:flutter_practice/add_new_task_modal.dart';
import 'package:flutter_practice/todo.dart';
import 'package:flutter_practice/update_task_modal.dart';

import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

//class start
class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddNewTaskModal(
                  onAddTap: (Todo task) {
                    addTodo(task);
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),

      body: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final Todo todo = todoList[index];
          final String formattedDate =
              DateFormat('hh:mm a dd-MM-yy').format(todo.createdDateTime);
          
          //list tile started   
          return ListTile(
            tileColor: todo.status == 'done' ? Colors.grey : null,
            //ontap started
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Actions'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //ch1
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Update'),
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return UpdateTaskModal(
                                      todo: todo,
                                      onTodoUpdate: (String updateDetailsText) {
                                        updateTodo(index, updateDetailsText);
                                      },
                                    );
                                  });
                            },
                          ),

                          //ch2
                          Divider(
                            height: 0,
                          ),
                          //ch3
                          ListTile(
                            leading: Icon(Icons.delete_outline),
                            title: Text('Delete'),
                            onTap: () {
                              deleteTodo(index);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            //on tap ended

            onLongPress: () {
              String currentStatus =
                  todo.status == 'pending' ? 'done' : 'pending';
              updateTodoStatus(index, currentStatus);
            },

            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(todo.details),
            subtitle: Text(formattedDate),
            trailing: Text(todo.status.toUpperCase()),

          );
          //list tile ended

        },

        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        }
      ),

    );
  } 
  //build ended

//methods start
void addTodo(Todo todo){
  todoList.add(todo);
  setState((){});
}


void deleteTodo(int index){
  todoList.removeAt(index);
  setState((){});
}


void updateTodo(int index, String todoDetails){
  todoList[index].details=todoDetails;
  setState((){});
}

void updateTodoStatus(int index, String status){
  todoList[index].status=status;
  setState((){});
}

}
//class end




