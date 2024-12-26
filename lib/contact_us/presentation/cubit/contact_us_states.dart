abstract class ContactUsStates {}

class ContactUsInitialState extends ContactUsStates{}

class ContactUsSuccessState extends ContactUsStates{}
class ContactUsFailedState extends ContactUsStates{}
class ContactUsNwConnectionFailedState extends ContactUsStates{}
class ContactUsLoadingState extends ContactUsStates{}