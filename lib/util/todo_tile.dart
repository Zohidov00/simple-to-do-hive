import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  TodoTile({
    super.key,
    required this.taskname,
    required this.taskComplated,
    required this.onChanged,
    required this.deleteFunction,
  });
  final String taskname;
  final bool taskComplated;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: taskComplated ? Colors.yellow[200] : Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),

          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskComplated,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Expanded(
                child: Text(
                  taskname,
                  style: TextStyle(
                    decoration:
                        taskComplated
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
