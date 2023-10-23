import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/size_order_cubit.dart';
import 'package:stytore/features/home/block/size_order_cubit_state.dart';

class SizeOrderWidget extends StatelessWidget {
  const SizeOrderWidget({super.key, required this.LsitOfSize});

  final List LsitOfSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SizeOrderCubit, SizeOrderCubitState>(
      builder: (context, sizeState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 20.w),
            child: Text(
              "Order Status",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(189, 0, 0, 0)),
            ),
          ),

          // the sizes

          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.w),
                    child: CustomSizeOrderBottons(
                      cont: index == 0
                          ? sizeState.small
                          : index == 1
                              ? sizeState.medium
                              : index == 2
                                  ? sizeState.large
                                  : index == 3
                                      ? sizeState.xlarge
                                      : sizeState.xxlarge,
                      text: LsitOfSize[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSizeOrderBottons extends StatelessWidget {
  bool cont;
  String text;
  CustomSizeOrderBottons({
    super.key,
    required this.cont,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "S") {
          context.read<SizeOrderCubit>().chooseSmall();
        } else if (text == "M") {
          context.read<SizeOrderCubit>().chooseMadium();
        } else if (text == "L") {
          context.read<SizeOrderCubit>().chooseLarge();
        } else if (text == "XL") {
          context.read<SizeOrderCubit>().chooseXlarge();
        } else if (text == "XXL") {
          context.read<SizeOrderCubit>().chooseXxlarge();
        }
      },
      child: Container(
        width: 45.w,
        decoration: BoxDecoration(
          color: cont == false
              ? const Color.fromARGB(255, 224, 222, 222)
              : Colors.purple,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: cont == false ? Colors.black : Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
