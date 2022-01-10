import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/list/list_view_paginate.dart';
import 'package:location_specialist/pages/main/providers/specialist_provider.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_item.dart';
import 'package:provider/provider.dart';

class SpecialistList extends StatelessWidget {
  const SpecialistList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FutureProviderCustom<SpecialistProvider>(
        create: new SpecialistProvider(),
        child: Consumer<SpecialistProvider>(
          builder: (context, provider, child) => RefreshIndicator(
            onRefresh: () async {
            await  provider.refresh();
            },
            child: ListViewPaginate(
                paginator: provider,
                itemBuilder: (context, index) {
                  return SpecialistItem(
                      specialist: provider.specialists[index]);
                },
                separatorBuilder: (context, index) {
                  return StyleHandler.y_margin;
                },
                itemCount: provider.specialists.length),
          ),
        ),
      ),
    );
  }
}
