import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';

class PopulerItems extends StatelessWidget {
  const PopulerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
      builder: (context, prodacts) =>
          BlocBuilder<TabBarCubit, TabBarCubitState>(
        builder: (context, state) {
          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prodacts.prodactsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      prodacts.prodactsList[index]["image"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
