abstract class UseCase<Output> {
  Output call();

  void dispose();
}

abstract class UseCaseParams<Params, Output> {
  Output call(Params params);

  void dispose();
}
