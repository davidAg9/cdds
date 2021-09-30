import 'package:cdds/src/model/drug.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CDDSDrugWidget extends StatelessWidget {
  final Drug drug;
  const CDDSDrugWidget({Key? key, required this.drug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _cardColor(drug.drugExpiryStatus),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 30.h,
        width: 90.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            drug.imageUrl != null
                ? Container(
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(drug.imageUrl ?? ""),
                          fit: BoxFit.cover,
                        )),
                  )
                : const SizedBox.shrink(),
            Text.rich(
              TextSpan(
                text: "\t\t\tProduct Name : ",
                children: [TextSpan(text: drug.name, style: GoogleFonts.workSans(fontSize: 12.sp))],
                style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\t\t\tStrength : ",
                children: [
                  TextSpan(text: drug.strength, style: GoogleFonts.workSans(fontSize: 12.sp))
                ],
                style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\t\t\tCompany : ",
                children: [
                  TextSpan(
                      text: drug.representativeCompany,
                      style: GoogleFonts.workSans(fontSize: 12.sp))
                ],
                style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\t\t\tManufacturer : ",
                children: [
                  TextSpan(text: drug.manufacturer, style: GoogleFonts.workSans(fontSize: 12.sp))
                ],
                style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\t\t\tExpiry  Date : ",
                children: [
                  if (drug.expiryDate != null)
                    TextSpan(
                      text: formatDate(drug.expiryDate!, [dd, '-', mm, '-', yyyy]),
                      style: GoogleFonts.workSans(fontSize: 12.sp),
                    )
                  else
                    const TextSpan(
                      text: "Unknown",
                      style: TextStyle(color: Colors.red),
                    )
                ],
                style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 0.4.h,
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Expiry Status ",
            //     style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 16.sp),
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _getColorStatus(drug.drugExpiryStatus),
                  // color: Colors.orange[800],
                ),
                child: Center(
                  child: Text(
                    drug.drugExpiryStatus.toString().replaceAll("DrugStatus.", "").toUpperCase(),
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color? _cardColor(DrugStatus drugStatus) {
    switch (drugStatus) {
      case DrugStatus.safe:
        return Colors.green[200];
      case DrugStatus.expired:
        return Colors.red[200];
      case DrugStatus.unknown:
        return Colors.orange[200];
      default:
        return Colors.white;
    }
  }

  Color? _getColorStatus(DrugStatus drugStatus) {
    switch (drugStatus) {
      case DrugStatus.safe:
        return Colors.green[800];
      case DrugStatus.expired:
        return Colors.red[800];
      case DrugStatus.unknown:
        return Colors.orange[800];
      default:
        return Colors.white;
    }
  }
}
