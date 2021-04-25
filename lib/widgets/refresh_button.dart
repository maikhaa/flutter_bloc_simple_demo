import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_demo/bloc/weather_bloc.dart';

class RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherStatus.loadedMetric:
          case WeatherStatus.loadedImperial:
            return Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                  onPressed: () {
                    weatherBloc.add(GetWeather(state.weather!.city));
                  },
                ),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
