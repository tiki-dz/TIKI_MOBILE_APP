import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/Models/model.categoris.dart';
import 'package:get/get.dart';
import 'package:tiki/constWidgets/progressIndicator.dart';
import 'package:tiki/controllers/homeController.dart';
import 'package:tiki/views/Home/categories/widget.eventModePagination.dart';
import '../../../constWidgets/noItem.dart';
import '../../../data/pallete.data.dart';
import '../component/widget.searchBar.dart';
import 'component.itemModelCategorie.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({required this.selected, Key? key}) : super(key: key);
  int selected;

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: linear,
            ),
            child: Column(
              children: [
                searchBar(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: GetBuilder(
                        init: controller,
                        builder: (context) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 5.h,
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                                  itemCount: controller.categories.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        controller.updateSelected(index);
                                      },
                                      child: categoryWidgetModel(
                                          controller.selected == index,
                                          controller.categories[index]
                                              .adjustName()),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 2.w,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                  child: controller.currentIsEmpty()
                                      ? noItemWidgetModel()
                                      : ListView.separated(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 3.h),
                                    itemCount: controller.currentLength(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          eventModelPagination(
                                              controller.currentEvent(index)),
                                          Visibility(
                                              visible:
                                              controller.currentLength() -
                                                  1 ==
                                                  index &&
                                                  controller
                                                      .currentHaveNext(),
                                              child: controller
                                                  .currentGetting()
                                                  ? circularProgressModel()
                                                  : InkWell(onTap: ()async{
                                                print('ccc');
                                                await controller .getNextPageEvents();
                                              },child: paginationModel()))
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(height: 3.h);
                                    },
                                  ))
                            ],
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
