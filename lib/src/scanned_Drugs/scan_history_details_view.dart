import 'package:cdds/src/model/drug.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ScanHistoryDetails extends StatelessWidget {
  const ScanHistoryDetails({Key? key, required this.drug}) : super(key: key);
  final Drug drug;
  static const routeName = '/scanhistorydetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drug Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Text(drug.name)),
          Center(child: Text(drug.strength)),
          Row(
            children: [
              Text(drug.registrationNumber),
              Text(
                formatDate(drug.registrationDate, [dd, MM, yyyy]),
              ),
            ],
          ),
          if (drug.expiryDate != null)
            Text(
              formatDate(drug.expiryDate!, [dd, MM, yyyy]),
            )
          else
            const SizedBox.shrink(),
          Text(drug.representativeCompany),
          Text(drug.manufacturer),
        ],
      ),
    );
  }
}
