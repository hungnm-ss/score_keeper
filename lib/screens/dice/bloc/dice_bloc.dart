import 'dart:async';

import 'package:score_keeper/screens/dice/bloc/dice_event.dart';
import 'package:score_keeper/screens/dice/bloc/dice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(DiceInitialState()) {
    on<DiceStartedEvent>(_mapStartedEventToState);
  }

  FutureOr<void> _mapStartedEventToState(
      DiceStartedEvent event, Emitter<DiceState> emit) async {}
}
