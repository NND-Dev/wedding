abstract class Failure {
  final String? message;
  Failure([this.message]);
}

class GeneralFailure extends Failure {
  GeneralFailure([String? message]) : super(message);
}