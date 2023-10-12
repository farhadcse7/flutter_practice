
import 'package:flutter/material.dart';
import 'package:flutter_practice/todo.dart';

class UpdateTaskModal extends StatefulWidget{
  const UpdateTaskModal({
    super.key,
    required this.todo,
    required this.onTodoUpdate
  });
  final Todo todo;
  final Function(String) onTodoUpdate;
  
  @override
  State<UpdateTaskModal> createState() {
    return _UpdateTaskModalState();
  }

}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
  late TextEditingController todoTEController;

  @override
  void initState(){
    super.initState();
    todoTEController=TextEditingController(text: widget.todo.details);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          //ch1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Update todo', style: Theme.of(context).textTheme.titleLarge,),
              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close)),  
            ],
          ),

          //ch2
          SizedBox(height: 24,),

          //ch3
          TextFormField(
            controller: todoTEController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Enter your todo here",
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),

          //ch4
          SizedBox(height: 16,),

          //ch5
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              widget.onTodoUpdate(todoTEController.text.trim());
              Navigator.pop(context);
            },
             child: Text('Update'),
            ),
          )


        ],
      ),
      );

  }

}