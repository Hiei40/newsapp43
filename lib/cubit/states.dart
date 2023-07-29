abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error;

  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String error;

  NewsGetSportsErrorStates(this.error);
}
class NewsGetSiecnceLoadingState extends NewsStates {}

class NewsGetSiecnceSuccessStates extends NewsStates {}

class NewsGetSiecnceErrorStates extends NewsStates {
  final String error;

  NewsGetSiecnceErrorStates(this.error);
}
class NewsChangeModeStates extends NewsStates {}
class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates {}

class NewsGetSearchErrorStates extends NewsStates {
  final String error;

  NewsGetSearchErrorStates(this.error);
}