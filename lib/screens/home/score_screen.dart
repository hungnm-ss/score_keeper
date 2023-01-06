import 'package:score_keeper/data/model/user.dart';
import 'package:score_keeper/routes.dart';
import 'package:score_keeper/screens/home/bloc/score_bloc.dart';
import 'package:score_keeper/screens/home/bloc/score_event.dart';
import 'package:score_keeper/screens/home/bloc/score_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_keeper/utils/extensions/context_extension.dart';
import 'package:score_keeper/utils/parse_format/parse_util.dart';
import 'package:score_keeper/utils/styles.dart';
import 'package:score_keeper/widgets/my_appbar.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late ScoreBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.add(ScoreGetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreBloc, ScoreState>(
        builder: _builder, listener: _listener);
  }

  void _listener(BuildContext context, ScoreState state) {}

  Widget _builder(BuildContext context, ScoreState state) {
    return Scaffold(
      appBar: MyAppBar(
        isBackNavigation: false,
        actionWidgets: [
          IconButton(
              onPressed: () {
                _bloc.add(ScoreAddUserEvent());
              },
              icon: const Icon(Icons.add, color: Colors.greenAccent))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: _bloc.users.map((user) {
          return _itemUser(context, user);
        }).toList(),
      ),
    );
  }

  Widget _itemUser(BuildContext context, User user) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Color(Parse.toIntValue(user.color)),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${user.name}",
                style: s(fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.editUser,
                            arguments: user)
                        .then((value) {
                      if (value is String && value == "delete") {
                        _bloc.add(ScoreGetUsersEvent());
                      }
                    });
                  },
                  icon: const Icon(Icons.mode_edit_outlined))
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _bloc.add(ChangeScoreEvent(user: user, isIncrease: false));
                },
                onLongPress: () {},
                child: const Icon(Icons.remove_sharp),
              ),
              Expanded(
                child: GestureDetector(
                  onLongPress: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "${user.score}",
                      textAlign: TextAlign.center,
                      style: s(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _bloc.add(ChangeScoreEvent(user: user, isIncrease: true));
                },
                onLongPress: () {},
                child: const Icon(Icons.add_sharp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
