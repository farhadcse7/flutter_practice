import 'package:flutter/material.dart';
import 'package:flutter_practice/todo.dart';

class AddNewTaskModal extends StatefulWidget{

  AddNewTaskModal({
    super.key,
    required this.onAddTap,
  });

  final Function(Todo) onAddTap;

  @override
  State<AddNewTaskModal> createState() {
    return _AddNewTaskModalState();
  }
}

class _AddNewTaskModalState extends State<AddNewTaskModal>{
  final TextEditingController todoTEController = TextEditingController();
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //ch1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add new todo', style: Theme.of(context).textTheme.titleLarge,),
                IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close)),
              ],
            ),
            //ch2
            const SizedBox(height: 24,),

            //ch3
            TextFormField(
              maxLines: 4,
              controller: todoTEController,
              decoration: const InputDecoration(
                hintText: 'Enter Your Todo Here',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
               ),

              validator: (String? value){
                if(value?.isEmpty ?? true){
                  return 'Enter a value';
                }
                return null;
              },
            ),

            //ch4
            const SizedBox(height: 16,),

            //ch5
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Todo todo=Todo(details:todoTEController.text.trim(),
                    createdDateTime: DateTime.now(),
                    updatedDateTime: DateTime.now(),);
                    widget.onAddTap(todo);
                    Navigator.pop(context);
                  }
                  //if end
                },
                child: const Text('Add'),
              ),
            ),

          ],
          
        ),
      ),
      );
    
  }//build end


}//class end