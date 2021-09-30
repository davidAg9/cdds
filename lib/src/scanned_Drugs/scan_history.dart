import 'package:cdds/src/model/drug.dart';
import 'package:cdds/src/scanned_Drugs/scan_history_details_view.dart';
import 'package:cdds/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

/// Displays a list of SampleItems.
class ScanHistory extends StatelessWidget {
  ScanHistory({
    Key? key,
    this.drugs = const [],
  }) : super(key: key);

  static const routeName = '/scanhistory';

  List<Drug> drugs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Scan History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'ScanHistory',
        itemCount: drugs.length,
        itemBuilder: (BuildContext context, int index) {
          final item = drugs[index];

          return ListTile(
              title: Text('SampleItem ${drugs[index].dbId}'),
              leading: const CircleAvatar(
                // Display the drug  image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  ScanHistoryDetails.routeName,
                );
              });
        },
      ),
    );
  }
}