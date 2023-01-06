import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_keeper/database/db_manager.dart';
import 'package:score_keeper/widgets/my_appbar.dart';

import '../../utils/styles.dart';
import 'bloc/edit_user_bloc.dart';
import 'bloc/edit_user_state.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late EditUserScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditUserScreenBloc, EditUserScreenState>(
        builder: _builder, listener: _listener);
  }

  void _listener(BuildContext context, EditUserScreenState state) {}

  Widget _builder(BuildContext context, EditUserScreenState state) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Edit ${_bloc.user.name}",
        actionWidgets: [
          IconButton(
              onPressed: () async{
                await DbManager.instance.deleteUser(_bloc.user);
                Navigator.pop(context, "delete");
              },
              icon: const Icon(Icons.delete_forever_rounded, color: Colors.redAccent))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "",
                style: s(fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
