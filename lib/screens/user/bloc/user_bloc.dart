import 'dart:async';

import 'package:base_flutter/screens/user/bloc/user_event.dart';
import 'package:base_flutter/screens/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserStartedEvent>(_mapStartedEventToState);
  }

  FutureOr<void> _mapStartedEventToState(
      UserStartedEvent event, Emitter<UserState> emit) async {}
}
