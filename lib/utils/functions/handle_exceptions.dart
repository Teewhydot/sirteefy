import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../sirteefy/domain/exceptions/custom_exceptions.dart';
import '../../sirteefy/domain/failures/failures.dart';

Future<Either<Failure, T>> handleExceptions<T>(Future<T> Function() function) async {
  try {
    final result = await function();
    return Right(result);
  } on ServerException catch (_) {
    return Left(ServerFailure(message: 'Server Failure'));
  } on TimeoutException catch (_) {
    return Left(TimeoutFailure(message: 'Request Timed Out'));
  } on SocketException catch (_) {
    return Left(NoInternetFailure(message: 'No Internet'));
  } catch (e) {
    return Left(UnknownFailure(message: e.toString()));
  }
}
