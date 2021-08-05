abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBuisenessLoadingState extends NewsStates {}

class NewsGetBuisnessSuccessState extends NewsStates {}

class NewsGetBuisnessErrorState extends NewsStates {
  final String error;

  NewsGetBuisnessErrorState(this.error);
}


class NewsSportsLoadingState extends NewsStates {}

class NewsSportsSuccessState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;
  NewsSportsErrorState(this.error);
}

class NewsSicnceLoadingState extends NewsStates {}

class NewsSicnceSuccessState extends NewsStates {}

class NewsSicnceErrorState extends NewsStates {
  final String error;
  NewsSicnceErrorState(this.error);
}


class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {
  final String error;
  NewsSearchErrorState(this.error);
}




