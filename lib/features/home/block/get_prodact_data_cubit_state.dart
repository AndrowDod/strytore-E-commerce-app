abstract class GetProdactDataCubitState {
  List summerList;
  List menList;
  List womenList;
  List prodactsList;

  GetProdactDataCubitState({
    required this.summerList,
    required this.menList,
    required this.womenList,
    required this.prodactsList,
  });
}

class GetProdactInitialCubit extends GetProdactDataCubitState {
  GetProdactInitialCubit()
      : super(
          summerList: [],
          menList: [],
          womenList: [],
          prodactsList: [],
        );
}

class SetProdactData extends GetProdactDataCubitState {
  SetProdactData(
    List summerListCubit,
    List menListCubit,
    List womenListCubit,
    List prodactsListCubit,
  ) : super(
          summerList: summerListCubit,
          menList: menListCubit,
          womenList: womenListCubit,
          prodactsList: prodactsListCubit,
        );
}
