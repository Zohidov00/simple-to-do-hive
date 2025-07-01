 import 'package:hive/hive.dart';

class ToDoDataBase{
    List todoList = [];
    final _myBox = Hive.box('mybox');

    void initiallyToDo(){
      todoList = [
        ["Make tutorial",false],
        ["Do Exercise", false]
      ];
    }

    void filter(index){
      todoList.sort((a, b) {
        if (a[1] == b[1]) return 0;
        if (!a[1] && b[1]) return -1;
        return 1;
      });
    }

    void loadData(){
      todoList = _myBox.get("TODOLIST");
    }
    
    void updateData(){
       _myBox.put("TODOLIST", todoList);
    }

 }

