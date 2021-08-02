import 'package:bloc_example/src/config/routes/app_routes.dart';
import 'package:bloc_example/src/config/themes/app_theme.dart';
import 'package:bloc_example/src/core/utils/constants.dart';
import 'package:bloc_example/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './src/presentation/blocs/remote_artworks/remote_artwork_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArtworkBloc>(create: (_) => injector()..add(const GetArtworks()),
    child: MaterialApp(
        title: kMaterialAppTitle,
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}

