import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/screen/home_bloc.dart';
import 'package:presentation/screen/home_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState<D> extends State<MyHomePage> {
  HomeBloc bloc = HomeBloc(PalindromeUseCase());

  void _incrementCounter() {
    bloc.checkPalindrome();
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
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
