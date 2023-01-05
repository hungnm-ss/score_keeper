import 'package:base_flutter/screens/home/bloc/home_bloc.dart';
import 'package:base_flutter/screens/home/bloc/home_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    // _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: _builder, listener: _listener);
  }

  void _listener(BuildContext context, HomeState state) {}

  Widget _builder(BuildContext context, HomeState state) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
