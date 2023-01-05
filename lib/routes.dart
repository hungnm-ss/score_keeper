import 'package:base_flutter/screens/user_detail/bloc/user_detail_bloc.dart';
import 'package:base_flutter/screens/root/root.dart';
import 'package:base_flutter/screens/user_detail/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String root = '/';
  static const String main = '/main_screen';
  static const String userDetail = '/userDetail';

  MaterialPageRoute pageRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case root:
            return const Root();
          case userDetail:
            return BlocProvider(
              create: (context) => UserDetailBloc(),
              child: const UserDetailScreen(),
            );
        }
        return const Scaffold();
      },
    );
  }
}
