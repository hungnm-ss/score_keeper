import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeStartedEvent>(_mapStartedEventToState);
  }

  FutureOr<void> _mapStartedEventToState(
      HomeStartedEvent event, Emitter<HomeState> emit) async {}
}