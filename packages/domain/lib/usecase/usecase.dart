abstract class UseCase<Output> implements Disposable {
  Output call();
}

abstract class UseCaseParams<Params, Output> implements Disposable {
  Output call(Params params);
}

abstract class Disposable {
  void dispose();
}
