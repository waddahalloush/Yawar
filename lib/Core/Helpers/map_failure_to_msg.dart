import 'package:easy_localization/easy_localization.dart';

import '../error/failures.dart';
import '../translations/locale_keys.g.dart';

String mapFailureToMessage(Failure failure, {String? unAuth}) {
  switch (failure.runtimeType) {
    case UnexpectedFailure:
      return LocaleKeys.unexpectedFailureMsg.tr();
    case UnprocessableFailure:
      return UnprocessableFailure.msg;
    case ForbiddenFailure:
      return ForbiddenFailure.msg;
    case CacheFailure:
      return LocaleKeys.cacheFailureMsg.tr();
    case NoInternetFailure:
      return LocaleKeys.noInternetConnectionException.tr();

    case UnauthorizedFailure:
      return unAuth ?? LocaleKeys.unauthorizedException.tr();
    case FetchDataFailure:
      return LocaleKeys.fetchDataException.tr();
    case BadRequestFailure:
      return LocaleKeys.badrequestException.tr();
    case NotFoundFailure:
      return LocaleKeys.notFoundException.tr();
    case ConflictFailure:
      return LocaleKeys.conflictException.tr();
    case InternalServerFailure:
      return LocaleKeys.internalServerErrorException.tr();
    case InvalidParametersFailure:
      return InvalidParametersFailure.msg;
    case OTPinvalidFailure:
      return LocaleKeys.otpInvalid.tr();
    default:
      return LocaleKeys.unexpectedFailureMsg.tr();
  }
}
