import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/widgets/image/image_list.dart';
import 'package:location_specialist/helpers/widgets/star/start_widget.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/title/custom_title.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_item_base.dart';

class SpecialistItem extends StatelessWidget {
  final Specialist specialist;
  const SpecialistItem({Key? key, required this.specialist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpecialistItemBase(
      specialist: specialist, 
      actions: [
        Flexible(
          child: Text(
            specialist.firstCategory,
          ),
        ),
        Flexible(child: StarWidget(rank: specialist.reviewAvg.toInt())),
      ],
    );
  }
}
