import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState<D> extends BlocState<MyHomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      dataStream: bloc.dataStream,
      children: (blocData) {
        final screenData = blocData.data;
        if (screenData is HomeData) {
          return SafeArea(child: _buildResultState(screenData));
        }
      },
    );
  }

  Widget _buildResultState(HomeData screenData) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
            child: ElevatedButton(
              onPressed: bloc.getRegistration,
              child: Center(
                child: Text("Get registration"),
              ),
            ),
          ),
          Text(screenData.registrationStep ?? ''),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.onEmailChanged,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            onChanged: bloc.onPhoneChanged,
            decoration: InputDecoration(
              hintText: 'Phone',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 16, right: 32),
            child: OutlinedButton(
              onPressed: bloc.sendRegistration,
              child: Center(
                child: Text("Send registration"),
              ),
            ),
          ),
        ],
      );
}
