import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_movies_app/app/bloc_observer.dart';

import 'app/app.dart';
import 'app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = di.sl<AppBlocObserver>();
  runApp(const ResponsiveMoviesApp());
}
