abstract class MainEvent{
  const MainEvent();
}

class MainBottomTabPress extends MainEvent{
  final int index;

  const MainBottomTabPress(this.index);

}
