abstract class TabBarCubitState {
  bool cont1;
  bool cont2;
  bool cont3;
  bool cont4;

  TabBarCubitState({
    required this.cont1,
    required this.cont2,
    required this.cont3,
    required this.cont4,
  });
}

class TabBarCubitInitial extends TabBarCubitState {
  TabBarCubitInitial()
      : super(
          cont1: true,
          cont2: false,
          cont3: false,
          cont4: false,
        );
}

class GetTabBarCubit extends TabBarCubitState {
  GetTabBarCubit(
    bool contState1,
    bool contState2,
    bool contState3,
    bool contState4,
  ) : super(
          cont1: contState1,
          cont2: contState2,
          cont3: contState3,
          cont4: contState4,
        );
}
