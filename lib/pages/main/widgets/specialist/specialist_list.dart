import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/pages/main/providers/specialist_provider.dart';
import 'package:location_specialist/pages/main/widgets/specialist/specialist_item.dart';
import 'package:provider/provider.dart';

class SpecialistList extends StatelessWidget {
  const SpecialistList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpecialistProvider>(
      create: (_) => new SpecialistProvider(),
      child: Consumer<SpecialistProvider>(
        builder:(context, provider, child) => ListView.separated(
            itemBuilder: (context, index) {
              return SpecialistItem(specialist: provider.specialists[index]);
            },
            separatorBuilder: (context, index) {
              return StyleHandler.y_margin;
            },
            
            itemCount: provider.specialists.length),
      ),
    );
  }
}
