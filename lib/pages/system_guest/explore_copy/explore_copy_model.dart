import '/components/item_map_view/item_map_view_widget.dart';
import '/components/modals/filters_modal/filters_modal_widget.dart';
import '/components/modals/stay_modal/stay_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'explore_copy_widget.dart' show ExploreCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExploreCopyModel extends FlutterFlowModel<ExploreCopyWidget> {
  ///  Local state fields for this page.

  bool mapView = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for itemMapView component.
  late ItemMapViewModel itemMapViewModel1;
  // Model for itemMapView component.
  late ItemMapViewModel itemMapViewModel2;
  // Model for itemMapView component.
  late ItemMapViewModel itemMapViewModel3;
  // Model for itemMapView component.
  late ItemMapViewModel itemMapViewModel4;

  @override
  void initState(BuildContext context) {
    itemMapViewModel1 = createModel(context, () => ItemMapViewModel());
    itemMapViewModel2 = createModel(context, () => ItemMapViewModel());
    itemMapViewModel3 = createModel(context, () => ItemMapViewModel());
    itemMapViewModel4 = createModel(context, () => ItemMapViewModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemMapViewModel1.dispose();
    itemMapViewModel2.dispose();
    itemMapViewModel3.dispose();
    itemMapViewModel4.dispose();
  }
}
