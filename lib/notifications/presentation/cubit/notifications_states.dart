abstract class NotificationsStates{}

class NotificationsInitialState extends NotificationsStates{}

class NotificationsReceivedState extends NotificationsStates{}


class GetAllNotificationsLoadingState extends NotificationsStates{}

class GetAllNotificationsSuccessState extends NotificationsStates{}

class GetAllNotificationsFailedState extends NotificationsStates{}

class GetAllNotificationsNwConnectionFailedState extends NotificationsStates{}