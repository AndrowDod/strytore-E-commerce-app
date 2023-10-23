abstract class CategoriesCubitState {
  bool? isChicked1;

  bool? isChicked2;

  bool? isChicked3;

  CategoriesCubitState({
    this.isChicked1,
    required this.isChicked2,
    required this.isChicked3,
  });
}

class CategoriesCubitInitial extends CategoriesCubitState {
  CategoriesCubitInitial()
      : super(
          isChicked1: false,
          isChicked2: false,
          isChicked3: false,
        );
}

class GetCategoriesCubit extends CategoriesCubitState {
  GetCategoriesCubit(
    bool isChicked1Cubit,
    bool isChicked2Cubit,
    bool isChicked3Cubit,
  ) : super(
          isChicked1: isChicked1Cubit,
          isChicked2: isChicked2Cubit,
          isChicked3: isChicked3Cubit,
        );
}
