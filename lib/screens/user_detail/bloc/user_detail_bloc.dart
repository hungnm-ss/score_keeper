import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_detail_event.dart';
import 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(UserDetailInitialState()) {
    on<UserDetailStartedEvent>(_mapStartedEventToState);
  }

  FutureOr<void> _mapStartedEventToState(
      UserDetailStartedEvent event, Emitter<UserDetailState> emit) async {}
}
