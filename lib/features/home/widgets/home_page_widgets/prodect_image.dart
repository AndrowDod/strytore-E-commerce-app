import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';
import '../../../../core/utils/constes.dart';
import '../../../../core/widgets/custom_space_widget.dart';

class ProdectImage extends StatelessWidget {
  const ProdectImage({super.key});

  @override
  Widget build(BuildContext context) {
    int? indexx;
    return BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
      builder: (context, prodacts) =>
          BlocBuilder<TabBarCubit, TabBarCubitState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(prodactDetailsRouteName, arguments: indexx);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 380.h,
                    child: CarouselSlider.builder(
                      itemCount: state.cont1 == true
                          ? prodacts.prodactsList.length
                          : state.cont2 == true
                              ? prodacts.summerList.length
                              : state.cont3 == true
                                  ? prodacts.menList.length
                                  : prodacts.womenList.length,
                      itemBuilder: (context, index, realIndex) {
                        indexx = index;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Image.network(
                                  state.cont1 == true
                                      ? prodacts.prodactsList[index]["image"]
                                      : state.cont2 == true
                                          ? prodacts.summerList[index]["image"]
                                          : state.cont3 == true
                                              ? prodacts.menList[index]["image"]
                                              : prodacts.womenList[index]
                                                  ["image"],
                                ),
                              ),
                            ),

                            // name of prodect
                            const SpaceWidget(),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Text(
                                state.cont1 == true
                                    ? prodacts.prodactsList[index]["desc"]
                                    : state.cont2 == true
                                        ? prodacts.summerList[index]["desc"]
                                        : state.cont3 == true
                                            ? prodacts.menList[index]["desc"]
                                            : prodacts.womenList[index]["desc"],
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),

                            // price of prodect

                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Text(
                                "\$ ${state.cont1 == true ? prodacts.prodactsList[index]["price"] : state.cont2 == true ? prodacts.summerList[index]["price"] : state.cont3 == true ? prodacts.menList[index]["price"] : prodacts.womenList[index]["price"]}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 350.h,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
