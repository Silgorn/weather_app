import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/features/weather/bloc/get_weather_bloc.dart';
import 'package:weather_app_2/features/weather/widgets/background_widget.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/circular_progress_indicator.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for city');

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(255, 47, 114, 168)),
        hintColor: Colors.white,
        textTheme: const TextTheme());
  }

  final _suggestions = [
    'London',
    'Kyiv',
    'Prague',
    'Helsinki',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          color: Colors.white,
          onPressed: () {
            query = '';
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        tooltip: 'Back',
        color: Colors.white,
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<GetWeatherBloc>().add(GetWeatherByCityEvent(query));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      close(context, null);
    });
    return Container(
      decoration: backgroundWidget(),
      child: Center(
        child: customCircularIndicator(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 76, 129, 173),
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Text(
                _suggestions[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: _suggestions.length,
          ),
        );
      },
    );
  }
}
