import 'package:provider/provider.dart';

import 'auth_provider.dart';

final multiProvider = [
  ChangeNotifierProvider<AuthProvider>(
    create: (_) => AuthProvider(),
    lazy: true,
  ),
];
