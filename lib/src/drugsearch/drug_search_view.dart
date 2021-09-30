import 'package:cdds/injection.dart';
import 'package:cdds/src/drugsearch/cdds_drug_bloc/cdds_drug_search_bloc.dart';
import 'package:cdds/src/drugsearch/drug_widget.dart';
import 'package:cdds/src/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class DrugSearchView extends StatelessWidget {
  DrugSearchView({Key? key}) : super(key: key);
  String? _query;
  static const String routeName = "/drugsearch";

  final FloatingSearchBarController _searchBarController = FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CddsDrugSearchBloc>(
      create: (_) => dp<CddsDrugSearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          // elevation: 1,
          leading: CircleAvatar(
            backgroundImage: const AssetImage("assets/images/cddslogo.jpeg"),
            maxRadius: 2.sp,
          ),
          title: const Text("CDDS Service"),
          centerTitle: true,
        ),
        floatingActionButton: BlocBuilder<CddsDrugSearchBloc, CddsDrugSearchState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  CupertinoIcons.qrcode_viewfinder,
                  color: Colors.red,
                  size: 30.sp,
                ),
                TextButton(
                  onPressed: () {
                    context.read<CddsDrugSearchBloc>().add(SearchForWithScan());
                  },
                  child: const Text(
                    "Scan Drug",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                )
              ],
            );
          },
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.sp,
                          color: Colors.red[300],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<CddsDrugSearchBloc, CddsDrugSearchState>(builder: (context, state) {
                    if (state is CddsDrugSearchInitial) {
                      return QrImage(
                        data: 'CDDS (Counterfeit Drug Detection Service) https://cdds.com',
                        version: QrVersions.auto,
                        size: 320,
                        gapless: false,
                        eyeStyle:
                            const QrEyeStyle(color: Colors.redAccent, eyeShape: QrEyeShape.circle),
                        dataModuleStyle: const QrDataModuleStyle(
                          color: Colors.grey,
                          dataModuleShape: QrDataModuleShape.circle,
                        ),
                        embeddedImage: const AssetImage('assets/images/cddslogo-trans.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(80, 80),
                        ),
                      );
                    } else if (state is CddsDrugSearchLoaded) {
                      return CDDSDrugWidget(drug: state.drug);
                    } else if (state is CddsDrugSearchError) {
                      return SizedBox(
                        height: 40.h,
                        width: 80.w,
                        child: Text(
                          "No Results Found",
                          style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                        ),
                      );
                    } else if (state is CddsDrugSearchLoading) {
                      return const CDDSLoadingWidget();
                    } else {
                      return QrImage(
                        data: 'CDDS (Counterfeit Drug Detection Service) https://cdds.com',
                        version: QrVersions.auto,
                        size: 320,
                        gapless: false,
                        eyeStyle:
                            const QrEyeStyle(color: Colors.redAccent, eyeShape: QrEyeShape.circle),
                        dataModuleStyle: const QrDataModuleStyle(
                          color: Colors.grey,
                          dataModuleShape: QrDataModuleShape.circle,
                        ),
                        embeddedImage: const AssetImage('assets/images/cddslogo-trans.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(80, 80),
                        ),
                      );
                    }
                  }),
                  const Spacer()
                ],
              ),
              BlocBuilder<CddsDrugSearchBloc, CddsDrugSearchState>(
                builder: (context, state) {
                  return FloatingSearchBar(
                    hint: 'Search...',
                    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                    transitionDuration: const Duration(milliseconds: 800),
                    transitionCurve: Curves.easeInOut,
                    physics: const BouncingScrollPhysics(),
                    transition: SlideFadeFloatingSearchBarTransition(),
                    controller: _searchBarController,
                    onQueryChanged: (query) {
                      _query = query;
                    },
                    actions: [
                      FloatingSearchBarAction(
                        showIfOpened: false,
                        child: CircularButton(
                          icon: const Icon(CupertinoIcons.search),
                          onPressed: () {
                            context
                                .read<CddsDrugSearchBloc>()
                                .add(SearchForDrug(serialORbarcodeNumber: _query ?? ""));
                            _searchBarController.open();
                          },
                        ),
                      ),
                      FloatingSearchBarAction(
                        showIfClosed: false,
                        showIfOpened: true,
                        child: CircularButton(
                          icon: const Icon(CupertinoIcons.xmark_circle),
                          onPressed: () {
                            _searchBarController.close();
                          },
                        ),
                      ),
                    ],
                    builder: (context, transition) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Material(
                          color: Colors.white,
                          elevation: 4.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: Colors.accents.map((color) {
                              return Container(height: 112, color: color);
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//  Drug(
//                               registrationNumber: "12345",
//                               name: "Paracetamol",
//                               strength: "5 mg",
//                               dbNo: "54321",
//                               manufacturer: "Para Laboratories",
//                               representativeCompany: "Para LTD",
//                               expiryDate: DateTime.now(),
//                               registrationDate: DateTime.now(),
//                             ),