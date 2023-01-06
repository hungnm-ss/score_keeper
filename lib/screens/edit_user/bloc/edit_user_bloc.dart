import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_keeper/data/model/user.dart';

import 'edit_user_event.dart';
import 'edit_user_state.dart';

class EditUserScreenBloc extends Bloc<EditUserScreenEvent, EditUserScreenState> {
  EditUserScreenBloc(this.user) : super(EditUserInitialState()){

  }

  final User user;
}
