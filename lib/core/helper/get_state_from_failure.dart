import 'package:quran_app/core/constant/app_enums.dart';
import 'package:quran_app/core/errors/failures.dart';

StateType getStateFromFailure(Failure failure) {
  if (failure is OfflineFailure) {
    return StateType.offline;
  } else if (failure is UnAuthenticatedFailure) {
    return StateType.forbidden;
  } else if (failure is UnAuthorizedFailure) {
    return StateType.unAuthorized;
  } else if (failure is NotFoundFailure) {
    return StateType.notFound;
  } else if (failure is BadRequestFailure) {
    return StateType.badRequest;
  } else if (failure is InternalServerErrorFailure) {
    return StateType.internalServerProblem;
  } else {
    return StateType.unexpectedProblem;
  }
}
