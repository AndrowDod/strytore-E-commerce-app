import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/widgets/custom_dialog_widget.dart';
import 'package:stytore/features/auth/auth_bloc/sign_in/signin_controller_cubit.dart';
import 'package:stytore/features/auth/auth_bloc/sign_in/signin_controller_cubit_state.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/prodacts_cubit.dart';
import 'package:stytore/features/home/block/prodacts_cubit_state.dart';
import 'package:stytore/features/home/block/size_order_cubit.dart';
import 'package:stytore/features/home/block/size_order_cubit_state.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';
import 'package:stytore/features/home/widgets/prodact_details_widgets/bottom_bar_functions.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
      builder: (context, state) => BlocBuilder<TabBarCubit, TabBarCubitState>(
          builder: (context, tabBarState) => SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            tabBarState.cont1 == true
                                ? state.prodactsList[index]["price"]
                                : tabBarState.cont2 == true
                                    ? state.summerList[index]["price"]
                                    : tabBarState.cont3 == true
                                        ? state.menList[index]["price"]
                                        : state.womenList[index]["price"],
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(224, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<ProdactsCubit, ProdactsCubitState>(
                      builder: (context, state2) => BlocBuilder<
                              GetProdactDataCubit, GetProdactDataCubitState>(
                          builder: (context, prodactsstate) => BlocBuilder<
                                  SignInControllerCubit,
                                  SingInControllerCubitState>(
                                builder: (context, signInstate) {
                                  return BlocBuilder<SizeOrderCubit,
                                      SizeOrderCubitState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 20.w),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (state.small == false &&
                                                state.medium == false &&
                                                state.large == false &&
                                                state.xlarge == false &&
                                                state.xxlarge == false) {
                                              // custom dialog

                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const CustomDialogWidget(
                                                  isSuccess: false,
                                                  text: "Please choose size",
                                                ),
                                              );
                                              // flushbarWidget(
                                              //     context,
                                              //     "try again",
                                              //     "Please choose size");
                                            } else {
                                              try {
                                                if (await checkIfIsALreadyAdded(
                                                        prodactsstate,
                                                        tabBarState,
                                                        state,
                                                        index,
                                                        context) !=
                                                    false) {
                                                  // if not add before

                                                  // ignore: use_build_context_synchronously
                                                  checkIfIsNotAdded(
                                                      prodactsstate,
                                                      tabBarState,
                                                      state,
                                                      index,
                                                      context);
                                                }
                                              } catch (e) {
                                                // ignore: use_build_context_synchronously
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const CustomDialogWidget(
                                                    isSuccess: false,
                                                    text: "please tyr again",
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 40.h,
                                            width: 150.w,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 144, 99, 233),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Center(
                                                child: Text(
                                              "Add To Card ",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )),
                    ),
                  ],
                ),
              )),
    );
  }
}
