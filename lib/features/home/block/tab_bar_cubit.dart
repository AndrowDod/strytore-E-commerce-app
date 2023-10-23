import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';

class TabBarCubit extends Cubit<TabBarCubitState> {
  TabBarCubit() : super(TabBarCubitInitial());

  changeColorTabBar1() {
    emit(GetTabBarCubit(
      state.cont1 = true,
      state.cont2 = false,
      state.cont3 = false,
      state.cont4 = false,
    ));
  }

  changeColorTabBar2() {
    emit(GetTabBarCubit(
      state.cont1 = false,
      state.cont2 = true,
      state.cont3 = false,
      state.cont4 = false,
    ));
  }

  changeColorTabBar3() {
    emit(GetTabBarCubit(
      state.cont1 = false,
      state.cont2 = false,
      state.cont3 = true,
      state.cont4 = false,
    ));
  }

  changeColorTabBar4() {
    emit(GetTabBarCubit(
      state.cont1 = false,
      state.cont2 = false,
      state.cont3 = false,
      state.cont4 = true,
    ));
  }
}
