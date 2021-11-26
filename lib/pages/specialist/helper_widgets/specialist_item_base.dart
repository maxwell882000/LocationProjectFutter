import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/widgets/image/image_list.dart';
import 'package:location_specialist/helpers/widgets/star/start_widget.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/title/custom_title.dart';
import 'package:location_specialist/routes/path.dart';

class SpecialistItemBase extends StatelessWidget {
  final Specialist specialist;
  final List<Widget> actions;
  const SpecialistItemBase(
      {Key? key, this.actions = const [], required this.specialist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 80,
        child: LayoutBuilder(
          builder: (context, constraints) => CustomTitle(
              onTap: () {
                Get.toNamed(Path.SPECIALIST_PROFILE, arguments: specialist);
              },
              leading: ImageList(
                path: specialist.image,
                size: constraints.maxHeight,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: TextTitle(specialist.name)),
                  Flexible(
                    child: Text(
                      specialist.address,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ...actions,
                ],
              )),
        ),
      ),
    );
  }
}
