import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_item.dart';
import 'package:provider/provider.dart';

class   SpecialistFutureList extends StatelessWidget {
  final Future<List<Specialist>> request;
  const SpecialistFutureList({Key? key, required this.request})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Specialist>>(
        create: (_) => request,
        initialData: [],
        child: Consumer<List<Specialist>>(
            builder: (context, provider, child) => Column(
                  children: provider
                      .map<Widget>((e) => SpecialistItem(specialist: e))
                      .toList(),
                )));
  }
}
