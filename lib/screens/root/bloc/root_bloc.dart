import 'dart:async';

import 'package:base_flutter/screens/root/bloc/root_event.dart';
import 'package:base_flutter/screens/root/bloc/root_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(RootInitialized()){
    on<RootAppStartedEvent>(_mapStartedEventToState);
  }

  FutureOr<void> _mapStartedEventToState(RootAppStartedEvent event, Emitter<RootState> emit) {
  }
}
