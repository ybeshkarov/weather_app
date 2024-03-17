import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/utils/tost_message/toast_message.dart';
import 'package:weather_app/features/geocoding/di/geocoding_di.dart';
import 'package:weather_app/features/geocoding/presentation/bloc/bloc.dart';
import 'package:weather_app/features/geocoding/presentation/widgets/location_name_widget.dart';
import 'package:weather_app/features/weather/presentation/view/detailed_weather_view.dart';

class PlacesListView extends StatefulWidget {
  const PlacesListView({super.key});

  @override
  State<StatefulWidget> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeocodingBloc>.value(
      value: GetIt.instance()..add(const FetchLocationNamesEvent()),
      child: BlocConsumer<GeocodingBloc, GeocodingState>(
        listener: (context, state) {
          if (state is GeocodingErrorState) {
            ToastMessage.showErrorToast(state.error);
          }
        },
        builder: (context, state) {
          switch (state) {
            case LocationNamesDataState():
              return ListView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailedWeatherView(
                        location: state.locations.values.toList()[index],
                        locationName: state.locations.keys.toList()[index],
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: LocationNameWidget(
                      locationName: state.locations.keys.toList()[index],
                    ),
                  ),
                ),
                itemCount: state.locations.length,
                shrinkWrap: true,
              );
            case GeocodingIdleState():
              return const Text('Resolving location  ...');

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    GeocodingDi.init();
    super.initState();
  }

  @override
  void dispose() {
    GeocodingDi.dispose();
    super.dispose();
  }
}
