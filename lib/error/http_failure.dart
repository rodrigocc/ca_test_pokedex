import 'package:ca_test_pokedex/error/failure.dart';

class HttpFailure extends Failure {
  HttpFailure({super.message, super.response})
      : super(
          faituleType: FailureType.http,
        );
}
