import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'NEWS_API', obfuscate: true)
  static String newsApi = _Env.newsApi;
}
