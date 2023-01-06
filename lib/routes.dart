import 'package:score_keeper/data/model/user.dart';
import 'package:score_keeper/screens/edit_user/edit_user_screen.dart';
import 'package:score_keeper/screens/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/edit_user/bloc/edit_user_bloc.dart';

class Routes {
  static const String root = '/';
  static const String main = '/mainScreen';
  static const String editUser = '/editUser';

  MaterialPageRoute pageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case root:
            return const Root();
          case editUser:
            return BlocProvider(
              create: (context) =>
                  EditUserScreenBloc(settings.arguments as User),
              child: const EditUserScreen(),
            );
        }
        return const Scaffold();
      },
    );
  }
}
