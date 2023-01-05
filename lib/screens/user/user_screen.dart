import 'package:base_flutter/routes.dart';
import 'package:base_flutter/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        builder: _builder, listener: _listener);
  }

  void _listener(BuildContext context, UserState state) {}

  Widget _builder(BuildContext context, UserState state) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User'),
              ActionChip(
                label: const Text('Detail'),
                onPressed: () {
                  NavigationService.instance.navigateTo(Routes.userDetail);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
