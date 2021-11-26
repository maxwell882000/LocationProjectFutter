import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/interface/abstract_paginator.dart';
import 'package:location_specialist/helpers/models/paginator/paginator.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';

class ListViewPaginate extends StatefulWidget {
  final AbstractPaginator paginator;
  final Widget Function(BuildContext, int index) itemBuilder;
  final Widget Function(BuildContext, int index) separatorBuilder;
  final int itemCount;
  const ListViewPaginate(
      {Key? key,
      required this.paginator,
      required this.itemCount,
      required this.itemBuilder,
      required this.separatorBuilder})
      : super(key: key);

  @override
  _ListViewPaginateState createState() => _ListViewPaginateState();
}

class _ListViewPaginateState extends State<ListViewPaginate> {
  ScrollController _controller = ScrollController();
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
/*       widget.scrollReachEnd!(); */
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  @override
  void initState() {
    super.initState();
    print(_controller.hasClients);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.addListener(_scrollListener);
    });
  }

  Widget loadNew() {
    if (widget.paginator.loading) {
      return Center(child: CircularProgressIndicator());
    }
    if (widget.paginator.next) {
      return const SizedBox();
    }
    return BlackButton(
      onPressed: widget.paginator.nextPage,
      text: "Загрузить...",
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        /*     controller: _controller, */
        itemBuilder: (context, index) {
          if (index != widget.itemCount)
            return widget.itemBuilder(context, index);
          else
            return loadNew();
        },
        separatorBuilder: widget.separatorBuilder,
        itemCount: widget.itemCount + 1);
  }
}
