import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';
import 'package:stytore/features/home/block/size_order_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit_state.dart';
import 'package:stytore/features/home/widgets/prodact_details_widgets/bottom_bar_widget.dart';
import 'package:stytore/features/home/widgets/prodact_details_widgets/colors_widget.dart';
import 'package:stytore/features/home/widgets/prodact_details_widgets/custom_order_size_widget.dart';
import 'package:stytore/features/home/widgets/prodact_details_widgets/prodact_image.dart';

class ProdactDetailsPage extends StatefulWidget {
  const ProdactDetailsPage({super.key});

  @override
  State<ProdactDetailsPage> createState() => _ProdactDetailsPageState();
}

class _ProdactDetailsPageState extends State<ProdactDetailsPage> {
  @override
  void initState() {
    context.read<SizeOrderCubit>().disposeSizes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List listOfSize = ["S", "M", "L", "XL", "XXL"];

    List listOfColors = [
      Colors.black,
      Colors.red,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.greenAccent[100],
      Colors.purple[100],
    ];

    int indexChick =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString()) - 1;

    // int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        extendBodyBehindAppBar: true,

        // app bar

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<SizeOrderCubit>().disposeSizes();
              }),
        ),

        //body

        body: BlocBuilder<TabBarCubit, TabBarCubitState>(
            builder: (context, tabBarState) =>
                BlocBuilder<GetProdactDataCubit, GetProdactDataCubitState>(
                    builder: (context, state) {
                  int index;
                  if (indexChick == -1) {
                    tabBarState.cont1 == true
                        ? index = state.prodactsList.length - 1
                        : tabBarState.cont2 == true
                            ? index = state.summerList.length - 1
                            : tabBarState.cont3 == true
                                ? index = state.menList.length - 1
                                : index = state.womenList.length - 1;
                  } else {
                    index = int.parse(ModalRoute.of(context)!
                            .settings
                            .arguments
                            .toString()) -
                        1;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // prodact image

                      ProdactImageDetails(index: index),

                      // size order part

                      SizeOrderWidget(LsitOfSize: listOfSize),

                      ColorsWidget(listOfColors: listOfColors),

                      const Spacer(),

                      // bottom bar

                      BottomBarWidget(index: index),
                    ],
                  );
                })));
  }
}
