abstract class BaasAccess<T> {
  final T? data;

  const BaasAccess(this.data);
}

class BaasAccessSuccess<T> extends BaasAccess<T> {
  const BaasAccessSuccess(T super.data);
}

class BaasAccessFailure<T> extends BaasAccess<T> {
  const BaasAccessFailure(T super.data);
}
