import '/components/review_box_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'property_details_page_widget.dart' show PropertyDetailsPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PropertyDetailsPageModel
    extends FlutterFlowModel<PropertyDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for ReviewBox component.
  late ReviewBoxModel reviewBoxModel1;
  // Model for ReviewBox component.
  late ReviewBoxModel reviewBoxModel2;
  // Model for ReviewBox component.
  late ReviewBoxModel reviewBoxModel3;

  @override
  void initState(BuildContext context) {
    reviewBoxModel1 = createModel(context, () => ReviewBoxModel());
    reviewBoxModel2 = createModel(context, () => ReviewBoxModel());
    reviewBoxModel3 = createModel(context, () => ReviewBoxModel());
  }

  @override
  void dispose() {
    reviewBoxModel1.dispose();
    reviewBoxModel2.dispose();
    reviewBoxModel3.dispose();
  }
}
