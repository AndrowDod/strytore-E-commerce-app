import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';
import 'package:stytore/features/home/widgets/home_page_widgets/custom_top_bottons.dart';
import '../../../core/widgets/custom_drawer&drawer_Botton.dart';
import '../../auth/auth_bloc/sign_in/signin_controller_cubit.dart';
import '../../auth/auth_bloc/sign_in/signin_controller_cubit_state.dart';
import '../widgets/home_page_widgets/popluer_items.dart';
import '../widgets/home_page_widgets/prodect_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getData(String email) {
    context.read<GetProdactDataCubit>().getData();
    context.read<GetCartListDataCubit>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
      builder: (context, prodactsState) =>
          BlocBuilder<SignInControllerCubit, SingInControllerCubitState>(
              builder: (context, state) {
        if (prodactsState.prodactsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return StreamBuilder<Object>(
            stream: getData(state.emailController),
            builder: (context, snapshot) {
              return Scaffold(
                drawer: const TheDrawer(),
                backgroundColor: const Color(0xffF3ECFA),
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // the drawer botton

                        const DrawerBotton(),

                        //  find your style

                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 10.h),
                          child: Text(
                            "Find Tour Style ✌️",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // the categories

                        SizedBox(height: 15.h),
                        BlocBuilder<TabBarCubit, TabBarCubitState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTopBottons(
                                  cont: state.cont1,
                                  text: "All",
                                ),
                                CustomTopBottons(
                                  cont: state.cont2,
                                  text: "Summer",
                                ),
                                CustomTopBottons(
                                  cont: state.cont3,
                                  text: "Man",
                                ),
                                CustomTopBottons(
                                  cont: state.cont4,
                                  text: "Women",
                                ),
                              ],
                            );
                          },
                        ),

                        //the images of prodect

                        const ProdectImage(),

                        // populer items text

                        Padding(
                          padding: EdgeInsets.only(left: 20.h, right: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popler items",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 14.sp),
                              )
                            ],
                          ),
                        ),

                        //popular items

                        const PopulerItems(),

                        //sign out button test
                      ]),
                ),
              );
            });
      }),
    );
  }
}
