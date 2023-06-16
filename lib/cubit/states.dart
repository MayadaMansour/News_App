abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsChangedBottomNavState extends NewsStates{}
class NewsChangeMode extends NewsStates{}

class NewsGetLoadingState extends NewsStates{}
class NewsGetBusinessSucessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);

}

class NewsGetLoadingSportsState extends NewsStates{}
class NewsGetSportsSucessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);

}

class NewsGetLoadingScienceState extends NewsStates{}
class NewsGetScienceSucessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);

}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);

}

