import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/screen/app/app_page.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

class MyHomePage extends StatefulWidget {
  static const ROUTE_NAME = '/MyHomePage';

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        builder: (context) => MyHomePage(title: "title"),
      );

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState<D> extends BlocState<MyHomePage, HomeBloc> {
  void _validatePalindrome() {
    bloc.navigateToDetails();
  }

  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.dataStream,
        initialData: BlocData.init(),
        builder: (context, snapshot) {
          final blocData = snapshot.data;
          if (blocData is BlocData) {
            final screenData = blocData.data;
            if (blocData.isLoading) {
              return _buildComputationState();
            } else if (screenData is HomeData) {
              return _buildResultState(screenData);
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validatePalindrome,
        tooltip: 'Validate',
        child: const Icon(Icons.fingerprint),
      ),
    );
  }

  Widget _buildResultState(HomeData screenData) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(onChanged: bloc.setPalindromeString),
            Text('Is palindrome=${screenData.isPalindrome}'),
          ],
        ),
      );

  Widget _buildComputationState() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Waiting for a result'),
          ],
        ),
      );
}
