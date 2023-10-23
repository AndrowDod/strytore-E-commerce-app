import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:stytore/core/widgets/custom_button.dart';
import 'package:stytore/features/home/block/categories_cubit.dart';
import 'package:stytore/features/home/block/catrgories_cubit_state.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_decription_widget.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_name_of_prodact_widget.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_price_widget.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/choose_categories_widget.dart';
import '../../../core/widgets/flushbar_Widget.dart';
import '../block/prodacts_cubit.dart';
import '../widgets/add_new_prodact_widgets/upload_image.dart';

class AddNewProdact extends StatefulWidget {
  const AddNewProdact({super.key});

  @override
  State<AddNewProdact> createState() => _AddNewProdactState();
}

class _AddNewProdactState extends State<AddNewProdact> {
  File? file;

  String? imageName;

  XFile? image;

  String? url;

  Future pickImage() async {
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        // ignore: use_build_context_synchronously
        flushbarWidget(this.context, "Errore", "please choose image");
      } else {
        file = File(image!.path);

        imageName = basename(image!.path);

        setState(() {});
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future uploadImage() async {
    if (image != null) {
      // upload

      var refstorage = FirebaseStorage.instance.ref("prodacts/$imageName");

      await refstorage.putFile(file!);

      url = await refstorage.getDownloadURL();

      log(url!);
    }
  }

  Future<void> deleteFile(String url) async {
    try {
      await FirebaseStorage.instance.refFromURL(url).delete();
    } catch (e) {
      print("Error deleting db from cloud: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Add Prodact", style: TextStyle(fontSize: 18.sp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // the upload widget

            UploadImageWidget(image: file, pickImage: pickImage),

            //add name widget
            const AddNameWidget(),

            // add decription widget
            const AddDecriptionWidget(),

            // choose the categories widget
            const ChooseCategoriesWigdet(),

            // add price
            const AddPriceWidget(),

            // botton of add prodact
            BlocBuilder<CategoriesCubit, CategoriesCubitState>(
              builder: (context, state) => Center(
                child: Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: Buttons(
                    operation: "Add prodact",
                    onPressed: () {
                      if (image == null ||
                          AddDecriptionWidgetState
                              .descController.text.isEmpty ||
                          AddPriceWidgetState.priceController.text.isEmpty ||
                          AddNameWidgetState.nameController.text.isEmpty) {
                        flushbarWidget(
                            context, "try again", "please enter all fields");
                      } else {
                        uploadImage()
                            .then(
                              (value) => context.read<ProdactsCubit>().setData(
                                [
                                  state.isChicked1,
                                  state.isChicked2,
                                  state.isChicked3,
                                ],
                                url!,
                              ),
                            )
                            .then((value) => Navigator.pop(context));
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
