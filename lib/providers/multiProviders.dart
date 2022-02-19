// ignore_for_file: file_names

import 'package:provider/provider.dart';

import 'auth_provider.dart';

final multiProvider = [
  ChangeNotifierProvider<AuthProvider>(
    create: (_) => AuthProvider(),
    lazy: true,
  ),
];
