import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/core/constants/constants.dart';
import 'package:weather_app_2/features/weather/bloc/get_weather_bloc.dart';
import 'package:weather_app_2/features/weather/view/custom_search_delegate.dart';

class AppBarMainView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        Constants.appName,
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 47, 114, 168),
      centerTitle: true,
      leading: IconButton(
        onPressed: () =>
            context.read<GetWeatherBloc>().add(const GetWeatherByCoordEvent()),
        icon: const Icon(Icons.my_location),
      ),
      actions: [
        IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: CustomSearchDelegate()),
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
