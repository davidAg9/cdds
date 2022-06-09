import 'package:cdds/src/drugsearch/drug_widget.dart';
import 'package:cdds/src/model/drug.dart';
import 'package:flutter/material.dart';

/// Displays a list of SampleItems.
class ScanHistory extends StatelessWidget {
  ScanHistory({
    Key? key,
    this.drugs = const [],
  }) : super(key: key);

  static const routeName = '/';

  List<Drug> drugs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Scan History'),
      ),
      body: ListView.builder(
        restorationId: 'scanhistory',
        itemCount: drugs.length,
        itemBuilder: (BuildContext context, int index) {
          // final item = drugs[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CDDSDrugWidget(
                drug: drugs[index],
              ),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.redAccent),
                onTap: () {},
                child: const Text("More Information"),
              )
            ],
          );
        },
      ),
    );
  }
}
