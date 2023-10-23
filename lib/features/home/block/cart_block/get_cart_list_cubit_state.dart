abstract class GetCartListCubitState {
  List cartList;

  GetCartListCubitState({
    required this.cartList,
  });
}

class GetCartListInitialCubit extends GetCartListCubitState {
  GetCartListInitialCubit()
      : super(
          cartList: [],
        );
}

class SetCartListData extends GetCartListCubitState {
  SetCartListData(
    List cartListCubit,
  ) : super(
          cartList: cartListCubit,
        );
}
