import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_keeper/data/model/user.dart';
import 'package:score_keeper/database/db_manager.dart';
import 'package:score_keeper/utils/log_util.dart';

import 'score_state.dart';
import 'score_event.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreInitialState()) {
    on<ScoreGetUsersEvent>(_mapGetUsersEventToState);
    on<SortScoreEvent>(_mapSortScoreEventToState);
    on<ScoreAddUserEvent>(_mapAddUserEventToState);
    on<ScoreDeleteUserEvent>(_mapDeleteUserEventToState);
    on<ChangeScoreEvent>(_mapChangeScoreEventToState);
  }

  List<User> users = [];

  FutureOr<void> _mapAddUserEventToState(
      ScoreAddUserEvent event, Emitter<ScoreState> emit) async {
    final User user =
        User(name: "user ${users.length}", score: 0, color: "0xffA4BE7B");
    final result = await DbManager.instance.insertUser(user: user);
    add(ScoreGetUsersEvent());
  }

  FutureOr<void> _mapDeleteUserEventToState(
      ScoreDeleteUserEvent event, Emitter<ScoreState> emit) {}

  FutureOr<void> _mapGetUsersEventToState(
      ScoreGetUsersEvent event, Emitter<ScoreState> emit) async {
    final usersDb = await DbManager.instance.getUsers();
    users = usersDb;
    for (var user in usersDb) {
      LoggerUtil.log("User ${user.id}");
    }
    emit(ScoreInitialState());
  }

  FutureOr<void> _mapChangeScoreEventToState(
      ChangeScoreEvent event, Emitter<ScoreState> emit) async {
    final user = event.user;
    user.score = event.isIncrease
        ? user.score! + event.score
        : user.score! - event.score;
    final bool isSuccess = await DbManager.instance.updateUser(user: user);
    if (isSuccess) {
      add(ScoreGetUsersEvent());
    }
  }

  FutureOr<void> _mapSortScoreEventToState(SortScoreEvent event, Emitter<ScoreState> emit)async {
    final usersDb = await DbManager.instance.sortUsers(event.isASC);
    users = usersDb;
    for (var user in usersDb) {
      LoggerUtil.log("User ${user.id}");
    }
    emit(ScoreInitialState());
  }
}
