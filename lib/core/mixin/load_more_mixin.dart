import 'package:flutter/material.dart';

mixin LoadMoreMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= maxScroll * 0.9;
  }

  void listener() {}

  @override
  void initState() {
    scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(listener)
      ..dispose();
    super.dispose();
  }
}
