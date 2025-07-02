import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:notehub_app/application/note/note_cubit.dart';
import 'package:notehub_app/application/note_modify/note_modify_cubit.dart';
import 'package:notehub_app/core/assets_path.dart';
import 'package:notehub_app/domain/notes/note_model.dart';
import 'package:notehub_app/presentation/notes/note_modify_page.dart';

class NoteItemView extends StatelessWidget {
  NoteItemView({super.key, required this.note, required this.noteCubit});

  NoteModel note;
  final NoteCubit noteCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await NoteModifyPage.show(context, note: note);
      },
      onLongPress: () async {
        await showConfirmDeleteDialog(context);
        await noteCubit.init();
      },
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              note.image.isNotEmpty
                  ? Image.network(note.image, width: 76, height: 76)
                  : Image.asset(AssetsPath.imgNoteHub, width: 76, height: 76),

              SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      note.content,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green,
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Text(
                        note.tag,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  DateFormat(
                    'dd/MM/yyyy hh:mm a',
                  ).format(DateTime.parse(note.createAt)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showConfirmDeleteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm'),
            content: Text('Are your sure to delete this note?'),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              FilledButton(
                onPressed: () async {
                  bool deleteResult = await GetIt.I
                      .get<NoteModifyCubit>()
                      .deleteNote(note.id);
                  if (deleteResult) {
                    Navigator.of(context).pop();
                    EasyLoading.showSuccess('Delete note success');
                  } else {
                    EasyLoading.showError('Delete note error');
                  }
                },
                child: Text('Confirm'),
              ),
            ],
          ),
    );
  }
}
