import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/internal/values/app_images.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/screen/app/app_page.dart';

import 'details_bloc.dart';

class DetailsPage extends StatefulWidget {
  static const ROUTE_NAME = '/DetailsPage';

  @override
  State<StatefulWidget> createState() => _DetailsPageState();

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        builder: (context) => DetailsPage(),
      );
}

class _DetailsPageState extends BlocState<DetailsPage, DetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(AppImages.ic_cat_image),
            OutlinedButton(
              onPressed: () => {
                bloc.back(),
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
