import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:notehub_app/application/note/note_cubit.dart';
import 'package:notehub_app/application/note/note_state.dart';
import 'package:notehub_app/presentation/notes/note_item_view.dart';
import 'package:notehub_app/presentation/notes/note_modify_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteCubit _noteCubit = GetIt.I.get<NoteCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _noteCubit.init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () async {
              await NoteModifyPage.show(context);
              await _noteCubit.init();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<NoteCubit, NoteState>(
          bloc: _noteCubit,
          listener: (context, state) {
            if (state.isShowLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          listenWhen: (pre, curr) => true,
          buildWhen: (pre, curr) => true,
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return NoteItemView(
                  note: state.notes[index],
                  noteCubit: _noteCubit,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: state.notes.length,
            );
          },
        ),
      ),
    );
  }
}
