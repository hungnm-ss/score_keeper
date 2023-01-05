import 'package:base_flutter/screens/home/bloc/home_bloc.dart';
import 'package:base_flutter/screens/user/bloc/user_bloc.dart';
import 'package:base_flutter/routes.dart';
import 'package:base_flutter/screens/main_screen/bloc/main_bloc.dart';
import 'package:base_flutter/services/navigation_service.dart';
import 'package:base_flutter/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = Routes();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        /// Close keyboard when tap outside input zone
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: _buildMultiBlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeUtil.lightTheme,
          navigatorKey: NavigationService.instance.navigatorKey,
          initialRoute: Routes.root,
          onGenerateRoute: (settings) => routes.pageRoute(settings),
          darkTheme: ThemeUtil.lightTheme, // update dark theme here
        ),
      ),
    );
  }

  Widget _buildMultiBlocProvider({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (context) => MainBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
      ],
      child: child,
    );
  }

  Widget _buildMultiRepositoryProvider({required Widget child}) {
    return MultiRepositoryProvider(
      providers: [],
      child: child,
    );
  }
}
