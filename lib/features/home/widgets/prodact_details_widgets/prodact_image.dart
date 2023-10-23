import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';

class ProdactImageDetails extends StatelessWidget {
  const ProdactImageDetails({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
      builder: (context, state) => BlocBuilder<TabBarCubit, TabBarCubitState>(
        builder: (context, tabBarState) => Container(
          height: 400.h,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: Image.network(
              tabBarState.cont1 == true
                  ? state.prodactsList[index]["image"]
                  : tabBarState.cont2 == true
                      ? state.summerList[index]["image"]
                      : tabBarState.cont3 == true
                          ? state.menList[index]["image"]
                          : state.womenList[index]["image"],
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
