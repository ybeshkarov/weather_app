import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/utils/datetime/date_time_extension.dart';
import 'package:weather_app/core/utils/tost_message/toast_message.dart';
import 'package:weather_app/core/utils/weather/temperature_extension.dart';
import 'package:weather_app/core/utils/weather/wmo_weather.dart';
import 'package:weather_app/core/utils/weather/wmo_weather_to_asset.dart';
import 'package:weather_app/core/utils/weather/wmo_weather_to_text.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/weather/presentation/bloc/bloc.dart';
import 'package:weather_app/features/weather/presentation/wigets/weather_app_bar.dart';
import 'package:weather_app/features/weather/presentation/wigets/weather_card_widget.dart';
import 'package:weather_app/features/weather/presentation/wigets/weather_text_widget.dart';

class DetailedWeatherView extends StatelessWidget {
  const DetailedWeatherView({
    required this.location,
    required this.locationName,
    super.key,
  });

  final GeolocationEntity location;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>.value(
      value: GetIt.instance()
        ..add(
          FetchWeatherEvent(
            location: location,
            locationName: locationName,
          ),
        ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const WeatherAppBar(
              loadingWidget: Text('Loading...'),
            ),
            SliverToBoxAdapter(
              child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (_, state) {
                  if (state is WeatherErrorState) {
                    ToastMessage.showErrorToast(state.error);
                  }
                },
                builder: (context, state) {
                  if (state is WeatherDataState) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              state.weather.daily.time.length,
                              (index) => WeatherCard(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      state.weather.daily.time[index]
                                          .weekdayName(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    WeatherText(
                                      text: WmoWeather.getWMOFromCode(
                                        state.weather.daily.weatherCode[index],
                                      ).wmoToString(),
                                    ),
                                    Image.asset(
                                      WmoWeather.getWMOFromCode(
                                        state.weather.daily.weatherCode[index],
                                      ).getWeatherIconFromWMO(),
                                    ),
                                    WeatherText(
                                      text: state.weather.daily
                                          .getAverageTemperature(index),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
