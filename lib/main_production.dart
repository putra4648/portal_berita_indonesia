// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/app/app.dart';
import 'package:portal_berita_indonesia/bootstrap.dart';

void main() {
  bootstrap(() => App(newsRepository: NewsRepository()));
}
