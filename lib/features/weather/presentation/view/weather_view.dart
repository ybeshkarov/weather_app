import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/geocoding/presentation/view/places_list_view.dart';
import 'package:weather_app/features/weather/di/weather_di.dart';
import 'package:weather_app/features/weather/presentation/bloc/bloc.dart';
import 'package:weather_app/features/weather/presentation/wigets/weather_app_bar.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>.value(
      value: GetIt.instance()..add(const GetTrackedLocationWeatherEvent()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            WeatherAppBar(
              loadingWidget: Center(
                child: Text(
                  'Please select location',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: PlacesListView(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    WeatherDI.init();
    super.initState();
  }

  @override
  void dispose() {
    WeatherDI.dispose();
    super.dispose();
  }
}
