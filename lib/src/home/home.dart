import 'package:cdds/src/drugsearch/drug_search_view.dart';
import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/profile/profile.dart';
import 'package:cdds/src/scanned_Drugs/scan_history.dart';
import 'package:cdds/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView(
      {Key? key, this.user = const CDDSUSER(id: "id", email: "email@gmail.com", name: "Test App")})
      : super(key: key);
  final CDDSUSER user;
  static const String routeName = "/home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController? _tabcontroller;
  @override
  Widget build(BuildContext context) {
    _tabcontroller = _tabcontroller ?? TabController(vsync: this, length: 3);

    return SafeArea(
      left: false,
      right: false,
      top: false,
      child: Scaffold(
        bottomNavigationBar: buildBottomBar(currentIndex, (value) {
          setState(() {
            currentIndex = value;
          });
          _tabcontroller?.animateTo(value);
        }),
        body: TabBarView(
          controller: _tabcontroller,
          children: [
            DrugSearchView(),
            ScanHistory(
              drugs: widget.user.scannedDrugs,
            ),
            ProfileView(
              user: widget.user,
            )
          ],
        ),
      ),
    );
  }
}
