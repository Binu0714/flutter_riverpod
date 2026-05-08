import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio dio;
  UserRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final res = await dio.get('https://jsonplaceholder.typicode.com/users/$id');
      return Right(UserModel.fromJson(res.data));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}