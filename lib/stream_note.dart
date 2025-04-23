import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/task_widgets.dart';

import '../firestor.dart';

// ignore: must_be_immutable
class Stream_note extends StatelessWidget {
  final bool done;

  Stream_note(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore_Datasource().stream(done),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final noteslist = Firestore_Datasource().getNotes(snapshot);

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Prevents scroll conflict
          itemCount: noteslist.length,
          itemBuilder: (context, index) {
            final note = noteslist[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Firestore_Datasource().delet_note(note.id);
              },
              child: Task_Widget(note),
            );
          },
        );
      },
    );
  }
}
