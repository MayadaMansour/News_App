abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsChangedBottomNavState extends NewsStates{}
class NewsGetLoadingState extends NewsStates{}
class NewsGetBusinessSucessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);

}
