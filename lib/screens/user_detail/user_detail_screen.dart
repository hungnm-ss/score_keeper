import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_detail_bloc.dart';
import 'bloc/user_detail_event.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailBloc, UserDetailState>(
        builder: _builder, listener: _listener);
  }

  void _listener(BuildContext context, UserDetailState state) {}

  Widget _builder(BuildContext context, UserDetailState state) {
    return  Scaffold(
      body: Container(
        color: Colors.cyan,
        height: double.infinity,
        child: const Center(
          child: Text('User Detail'),
        ),
      ),
    );
  }
}
