abstract class MainState{
  const MainState();
}
class MainInitial extends MainState{}
class MainTabChanged extends MainState{
  final int index;

  const MainTabChanged(this.index);

}
