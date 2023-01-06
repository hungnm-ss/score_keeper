import 'package:flutter_bloc/flutter_bloc.dart';

import 'log_util.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    LoggerUtil.log('onEvent: ${event.toString()}', tag: '${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    LoggerUtil.log('onTransition: ${transition.toString()}',
        tag: '${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LoggerUtil.log('onError: ${error.toString()}',
        tag: '${bloc.runtimeType}');
    super.onError(bloc, error, stackTrace);
  }
}
