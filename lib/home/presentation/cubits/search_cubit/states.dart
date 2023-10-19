abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchByTermLoadingState extends SearchStates{}

class SearchByTermSuccessState extends SearchStates{}

class SearchByTermFailedState extends SearchStates{}

class SearchByTermNetworkConnectionFailedState extends SearchStates{}

