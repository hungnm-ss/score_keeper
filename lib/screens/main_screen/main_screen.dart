import 'package:base_flutter/screens/main_screen/bloc/main_event.dart';
import 'package:base_flutter/screens/main_screen/bloc/main_state.dart';
import 'package:base_flutter/screens/home/home_screen.dart';
import 'package:base_flutter/screens/user/user_screen.dart';
import 'package:base_flutter/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/color_util.dart';
import '../../widgets/my_appbar.dart';
import 'bloc/main_bloc.dart';

enum TabItem { home, user }

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
      drawer: const MyDrawer(),
      appBar: _buildAppBar(),
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
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorUtil.backgroundSecondary,
          elevation: 1.0,
          selectedItemColor: ColorUtil.primary,
          unselectedItemColor: const Color(0xFF828282),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedFontSize: 12.0,
          selectedFontSize: 12.0,
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomTabItems() {
    return [
      const BottomNavigationBarItem(
          label: 'Home',
          tooltip: "Home",
          icon: Icon(Icons.home, color: Colors.white),
          activeIcon: Icon(Icons.home)),
      const BottomNavigationBarItem(
          label: 'User',
          tooltip: "User",
          icon: Icon(Icons.person, color: Colors.white),
          activeIcon: Icon(Icons.person))
    ];
  }

  _onItemTapped(int index) {
    _mainBloc.add(MainBottomTabPress(index));
  }

  List<Widget> _getTabs() {
    return [
      const HomeScreen(),
      const UserScreen(),
    ];
  }

  _buildAppBar() {
    return MyAppBar(actionWidgets: [
      IconButton(
        tooltip: "?",
        icon: const Icon(Icons.question_mark),
        onPressed: () {},
      ),
    ]);
  }
}
