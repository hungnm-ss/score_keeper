import 'package:equatable/equatable.dart';
import 'package:score_keeper/data/model/user.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();

  @override
  List<Object?> get props => [];
}

class ScoreStartedEvent extends ScoreEvent {}

class ScoreGetUsersEvent extends ScoreEvent {}

class SortScoreEvent extends ScoreEvent {
  final bool isASC;

  const SortScoreEvent({this.isASC = true});
}

class ScoreAddUserEvent extends ScoreEvent {}

class ScoreDeleteUserEvent extends ScoreEvent {}

class ChangeScoreEvent extends ScoreEvent {
  final User user;
  final bool isIncrease;
  final int score;

  const ChangeScoreEvent({
    required this.user,
    required this.isIncrease,
    this.score = 1,
  });
}
