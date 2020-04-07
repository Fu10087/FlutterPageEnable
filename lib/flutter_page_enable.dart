library flutter_page_enable;

import 'package:flutter/material.dart';

class PageEnableScrollPhysics extends ScrollPhysics {

  final double pageSize;

  const PageEnableScrollPhysics({ ScrollPhysics parent, this.pageSize}) : super(parent: parent);

  @override
  PageEnableScrollPhysics applyTo(ScrollPhysics ancestor) {
    return PageEnableScrollPhysics(parent: buildParent(ancestor), pageSize: this.pageSize);
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / pageSize;
  }

  double _getPixels(ScrollMetrics position, double page) {
    return page * pageSize;
  }

  double _getTargetPixels(ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity)
      page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((position.pixels <= position.minScrollExtent) ||
        (position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}