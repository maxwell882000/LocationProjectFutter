import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/components/providers/start_provider.dart';
import 'package:location_specialist/helpers/components/widgets/star.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:provider/provider.dart';

class ListStars extends StatelessWidget {
  final ServiceReviewInterface repo;
  const ListStars({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<StarProvider>(
      create: new StarProvider(repo),
      child: Column(
        children: [
          TextTitle("Ваша оценка"),
          Row(
            children: [
              for(int i=1; i<= 5 ; i++)
              Expanded(
                child: Star(
                  mark: i,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
