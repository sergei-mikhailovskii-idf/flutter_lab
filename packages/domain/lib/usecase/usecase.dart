abstract class UseCase<Params, Output> {
  Output call(Params params);

  void dispose();
}
