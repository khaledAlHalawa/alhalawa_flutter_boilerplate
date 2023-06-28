import 'package:alhalawa_flutter_boilerplate/core/network/result/api_result.dart';

abstract class UseCase<T, Params> {
  Future<ApiResult<T>> call(Params params);
}

class NoParams {}
