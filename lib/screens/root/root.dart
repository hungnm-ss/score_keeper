import 'package:score_keeper/screens/root/bloc/root_state.dart';
import 'package:score_keeper/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/screen_utils/screen_utils.dart';
import 'bloc/root_bloc.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late RootBloc _rootBloc;

  @override
  void initState() {
    _rootBloc = BlocProvider.of<RootBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _rootBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<RootBloc, RootState>(
            buildWhen: _buildWhen,
            builder: _buildBody,
            listener: _listener,
          ),
        ),
        onWillPop: null);
  }

  bool _buildWhen(RootState previous, RootState current) {
    return true;
  }

  void _listener(BuildContext context, RootState state) {}

  Widget _buildBody(BuildContext context, RootState state) {
    return const MainScreen();
  }
}
