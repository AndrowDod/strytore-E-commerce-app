abstract class CountProdactCubitState {
  int count;

  CountProdactCubitState({
    required this.count,
  });
}

class CountProdactInitialCubit extends CountProdactCubitState {
  CountProdactInitialCubit()
      : super(
          count: 1,
        );
}

class SetCountProdact extends CountProdactCubitState {
  SetCountProdact(
    int countCubit,
  ) : super(
          count: countCubit,
        );
}
