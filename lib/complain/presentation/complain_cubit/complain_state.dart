abstract class ComplainStates{}

class ComplainInitialState extends ComplainStates{}


class CreateComplainLoadingState extends ComplainStates{}

class CreateComplainSuccessState extends ComplainStates{}

class CreateComplainFailedState extends ComplainStates{}

class ComplainNetworkFailedConnectionState extends ComplainStates{}
