import 'package:flutter/material.dart';

import '../constants/constants.dart';

void scrollPaginationListener({
  required ScrollController scrollController,
  required bool condition,
  required void Function() paginationFunction,
}) {
  if (scrollController.position.extentAfter < Constants.loadMoreExtentAfter &&
      condition) {
    paginationFunction();
  }
}
