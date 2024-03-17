import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/weather/temperature_extension.dart';
import 'package:weather_app/core/utils/weather/wmo_weather.dart';
import 'package:weather_app/core/utils/weather/wmo_weather_to_asset.dart';
import 'package:weather_app/features/weather/presentation/bloc/bloc.dart';
import 'package:weather_app/features/weather/presentation/wigets/weather_text_widget.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({required this.loadingWidget, super.key});

  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.blueAccent,
      collapsedHeight: 80,
      expandedHeight: 200,
      flexibleSpace: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherDataState) {
              // final temperature = _getTemperatureForTheDay(
              //   state.weather.daily,
              //   0,
              // );

              return Column(
                children: [
                  Image.asset(
                    WmoWeather.getWMOFromCode(
                      state.weather.daily.weatherCode.first,
                    ).getWeatherIconFromWMO(),
                  ),
                  Text(
                    state.locationName,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  WeatherText(
                    text: state.weather.daily.getAverageTemperature(0),
                  ),
                ],
              );
            }

            return loadingWidget;
          },
        ),
      ),
    );
  }
}
