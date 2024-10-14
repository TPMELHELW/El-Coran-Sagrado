import '../errors/exception.dart';
import '../errors/failures.dart';

Failure getFailureFromException(Object exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(message: exception.message);
  } else if (exception is UnAuthenticatedException) {
    return const UnAuthenticatedFailure(message: 'forbidden');
  } else if (exception is UnAuthorizedException) {
    return const UnAuthorizedFailure(message: 'unauthorized');
  } else if (exception is NotFoundException) {
    return const NotFoundFailure(message: 'notFound');
  } else if (exception is InternalServerErrorException) {
    return const InternalServerErrorFailure(
      message: 'internalServerError',
    );
  } else if (exception is OfflineException) {
    return const OfflineFailure(message: 'offline');
  } else {
    return const UnexpectedFailure(
      message: 'unexpectedException',
    );
  }
}
