abstract class CartCubitState {
  String id;

  String size;

  CartCubitState({
    required this.id,
    required this.size,
  });
}

class CartCubitInitial extends CartCubitState {
  CartCubitInitial()
      : super(
          id: "",
          size: "",
        );
}

class SetCartCubit extends CartCubitState {
  SetCartCubit(
    String idCubit,
    String sizeCubit,
  ) : super(
          id: idCubit,
          size: sizeCubit,
        );
}
