// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portal_berita_indonesia/app/app.dart';
import 'package:portal_berita_indonesia/bootstrap.dart';
import 'package:portal_berita_indonesia/injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await bootstrap(() => const App());
}
