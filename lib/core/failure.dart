import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {
  const Failure({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

final class FailureError extends Failure {
  const FailureError({required super.error});
}

final class FailureNetwork extends Failure {
  const FailureNetwork({required super.error});
}
