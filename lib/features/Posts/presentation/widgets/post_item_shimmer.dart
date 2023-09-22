import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yawar_test/Core/Config/Extensions/media_query_ex.dart';
import 'package:yawar_test/Core/Helpers/shimmer_widget.dart';

class PostItemShimmer extends StatelessWidget {
  const PostItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerWidget.circular(height: 15.r, width: 15.r),
              SizedBox(
                width: 5.w,
              ),
              ShimmerWidget.rectangular(height: 20.h, width: 120.w),
              SizedBox(
                width: 5.w,
              ),
              ShimmerWidget.circular(height: 15.r, width: 15.r),
              Spacer(),
              ShimmerWidget.circular(height: 25.r, width: 25.r),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ShimmerWidget.rectangular(height: 20.h, width: 250.w),
          SizedBox(
            height: 5.h,
          ),
          ShimmerWidget.rectangular(height: 20.h, width: 200.w),
          SizedBox(
            height: 5.h,
          ),
          ShimmerWidget.rectangular(height: 200.h, width: context.width),
          SizedBox(
            height: 10.h,
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerWidget.circular(height: 15.r, width: 15.r , marginH: 5.w),
                ShimmerWidget.circular(height: 15.r, width: 15.r, marginH: 5.w),
                ShimmerWidget.circular(height: 15.r, width: 15.r, marginH: 5.w),
                ShimmerWidget.circular(height: 15.r, width: 15.r, marginH: 5.w),Spacer(),ShimmerWidget.rectangular(height: 20.h, width: 200.w),
              ],
            ),
          ),
           Divider(color: Colors.grey, thickness: 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShimmerWidget.rectangular(height: 40.h, width: 100.w ),
              ShimmerWidget.rectangular(height: 40.h, width: 100.w ),
              ShimmerWidget.rectangular(height: 40.h, width: 100.w ),
             
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}
