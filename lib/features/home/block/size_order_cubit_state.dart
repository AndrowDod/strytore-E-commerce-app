abstract class SizeOrderCubitState {
  bool small;
  bool medium;
  bool large;
  bool xlarge;
  bool xxlarge;

  SizeOrderCubitState({
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });
}

class SizeOrderCubitInitial extends SizeOrderCubitState {
  SizeOrderCubitInitial()
      : super(
          small: false,
          medium: false,
          large: false,
          xlarge: false,
          xxlarge: false,
        );
}

class SetOrderBarCubit extends SizeOrderCubitState {
  SetOrderBarCubit(
    bool smallCubit,
    bool mediumCubit,
    bool largeCubit,
    bool xlargeCubit,
    bool xxlargeCubit,
  ) : super(
          small: smallCubit,
          medium: mediumCubit,
          large: largeCubit,
          xlarge: xlargeCubit,
          xxlarge: xxlargeCubit,
        );
}
