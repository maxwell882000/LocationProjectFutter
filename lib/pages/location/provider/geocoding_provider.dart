import 'package:easy_debounce/easy_debounce.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:location_specialist/helpers/components/providers/base_map_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart' as L;
import 'package:location_specialist/helpers/widgets/map/provider/base_search_provider.dart';

class GeocodingProvider extends BaseSearchProvider {
  var googleGeocoding =
      GoogleGeocoding("AIzaSyCP239Fc9kIk9NoU6z9JMVcE-_g_NCNtyE");
  @override
  void listnerText() {
    EasyDebounce.debounce("geocoding", Duration(milliseconds: 200), debounced);
  }

  debounced() async {
    if (controller.text.isNotEmpty) {
      var result = await googleGeocoding.geocoding.get(controller.text, []);
      print("RESULTS GOTED");
      print(result?.results);
      this.location = result?.results
              ?.where((element) =>
                  element.formattedAddress != null &&
                  element.geometry != null &&
                  element.geometry!.location != null &&
                  element.geometry!.location!.lat != null &&
                  element.geometry!.location!.lng != null)
              .map<L.Location>((e) => L.Location.gecoding(
                  latitude: e.geometry!.location!.lat!,
                  longitude: e.geometry!.location!.lng!,
                  name: e.formattedAddress!))
              .toList() ??
          [];
    }
  }
}
