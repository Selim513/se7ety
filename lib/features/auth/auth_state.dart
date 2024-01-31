class AuthStates {}

class initAuth extends AuthStates {}
//---------Login Auth---------------------

class SuccessLoginAuth extends AuthStates {}

class LoadingLoginAuth extends AuthStates {}

class ErrorLoginAuth extends AuthStates {
  final String Error;

  ErrorLoginAuth({required this.Error});
}

//------------register------------------
class SuccessRegisterAuth extends AuthStates {}

class LoadingRegisterAuth extends AuthStates {}

class ErrorRegisterAuth extends AuthStates {
  final String Error;

  ErrorRegisterAuth({required this.Error});
}

//--------------------------------register for patient --------------------------------
class PatientSuccessRegisterAuth extends AuthStates {}

class PatientLoadingRegisterAuth extends AuthStates {}

class PatientErrorRegisterAuth extends AuthStates {
  final String Error;

  PatientErrorRegisterAuth({required this.Error});
}
