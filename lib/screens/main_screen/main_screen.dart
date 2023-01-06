import 'package:score_keeper/screens/dice/dice_screen.dart';
import 'package:score_keeper/screens/main_screen/bloc/main_event.dart';
import 'package:score_keeper/screens/main_screen/bloc/main_state.dart';
import 'package:score_keeper/screens/home/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_keeper/utils/styles.dart';
import 'bloc/main_bloc.dart';

enum TabItem { score, dice }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = BlocProvider.of(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      builder: _builder,
      listener: listener,
    );
  }

  void listener(BuildContext context, state) {}

  Widget _builder(BuildContext context, state) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: IndexedStack(
        index: state is MainTabChanged ? state.index : 0,
        children: _getTabs(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (preState, nextState) => nextState is MainTabChanged,
      builder: (ctx, state) {
        return BottomNavigationBar(
          onTap: _onItemTapped,
          items: _bottomTabItems(),
          currentIndex: state is MainTabChanged ? state.index : 0,
          backgroundColor: Colors.black,
          elevation: 6.0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white60,
          selectedLabelStyle: s(color: Colors.greenAccent),
          showSelectedLabels: true,
          showUnselectedLabels: false,
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomTabItems() {
    return [
      const BottomNavigationBarItem(
          label: 'Score',
          icon: Icon(Icons.scoreboard_outlined),
          activeIcon: Icon(Icons.scoreboard_outlined)),
      const BottomNavigationBarItem(
          label: 'Dice',
          icon: Icon(Icons.casino_outlined),
          activeIcon: Icon(Icons.casino_outlined))
    ];
  }

  _onItemTapped(int index) {
    _mainBloc.add(MainBottomTabPress(index));
  }

  List<Widget> _getTabs() {
    return [
      const ScoreScreen(),
      const DiceScreen(),
    ];
  }
}
