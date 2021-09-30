import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ScanHistoryDetails extends StatelessWidget {
  const ScanHistoryDetails({Key? key}) : super(key: key);

  static const routeName = '/scanhistorydetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
