import 'package:api/main.dart';
import 'package:api/models/todos_model.dart';
import 'package:flutter/material.dart';

class TodoPending extends StatefulWidget {
  const TodoPending({super.key});

  @override
  State<TodoPending> createState() => _TodoPendingState();
}

class _TodoPendingState extends State<TodoPending> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: prendingActions.isEmpty
            ? Center(
                child: noData(data: () {}),
              )
            : ListView.builder(
                itemCount: prendingActions.length,
                itemBuilder: (context, i) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: CheckboxListTile(
                              title: Text(prendingActions[i].title!),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.blue,
                              value: prendingActions[i].completed,
                              onChanged: (value) {
                                setState(() {
                                  prendingActions[i].completed = value;
                                });
                              })));
                }));
  }
}