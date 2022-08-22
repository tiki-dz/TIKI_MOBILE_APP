import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/pallete.data.dart';
import '../../../../Models/model.city.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../controllers/EditProfileController.dart';

showCities(BuildContext context, List<CityModel> fullCities) {
  List<CityModel> cities = fullCities;
  showDialog(
      context: context,
      builder: (_) => StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (String filterName) {
                      setState(() => cities = fullCities
                          .where((element) =>
                              element.name
                                  .toLowerCase()
                                  .contains(filterName.toLowerCase()) ||
                              element.id
                                  .toString()
                                  .toLowerCase()
                                  .contains(filterName.toLowerCase()))
                          .toList());
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.sp),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.sp),
                          borderSide: BorderSide(color: KOrange, width: 1.sp)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.sp),
                          borderSide: BorderSide(color: Colors.white)),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(9.sp),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                        ),
                      ),
                      hintText: "search".tr,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 80.w,
                    child: ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                final controller =
                                    Get.find<EditProfileController>();
                                controller.cityController.text =
                                    cities[index].name;

                              },
                              child: cities[index].id == -1
                                  ? const SizedBox()
                                  : favoriteCurrencyWidgetModel(cities[index]));
                        }),
                  )
                ],
              ),
            );
          }));
}

Widget favoriteCurrencyWidgetModel(CityModel city) {
  return Container(
    margin: EdgeInsets.symmetric( horizontal: 5.w),
    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7.sp)),
    child: ListTile(
      contentPadding: EdgeInsets.only(right: 3.w),
      leading: Container(
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xffF5F7FA),
          borderRadius: BorderRadius.circular(7.sp),
        ),
        child: Center(
          child: Text(
            city.id.toString(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 9.sp),
          ),
        ),
      ),
      title: Text(
        city.name,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 10.sp),
      ),
    ),
  );
}
