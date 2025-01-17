// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:portal_berita_indonesia/app/app.dart';
import 'package:portal_berita_indonesia/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = true;
  // await di.init();
  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: HydratedStorageDirectory(
  //         (await getApplicationDocumentsDirectory()).path));
  await bootstrap(() => const App());
}
