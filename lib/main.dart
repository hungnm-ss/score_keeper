import 'package:base_flutter/app.dart';
import 'package:base_flutter/screens/root/bloc/root_event.dart';
import 'package:base_flutter/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/root/bloc/root_bloc.dart';
import 'config/app_config.dart';
import 'constants/enum.dart';

void main() {
  var flavor = Flavor.development;
  AppConfig(flavor, '');

  WidgetsFlutterBinding.ensureInitialized();
  //transparent status bar and navigation bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  BlocOverrides.runZoned(
    () => runApp(
      BlocProvider<RootBloc>(
        create: (ctx) => RootBloc()..add(RootAppStartedEvent()),
        child: const App(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}
