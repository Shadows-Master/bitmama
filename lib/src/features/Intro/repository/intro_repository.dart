import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'intro_repository.g.dart';

class IntroRepository {
  IntroRepository(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const introCompleteKey = 'introComplete';

  Future<void> setIntroComplete() async {
    await sharedPreferences.setBool(introCompleteKey, true);
  }

  bool isIntroComplete() => sharedPreferences.getBool(introCompleteKey) ?? false;

}

@Riverpod(keepAlive: true)
Future<IntroRepository> introRepository(IntroRepositoryRef ref) async {
  return IntroRepository(await SharedPreferences.getInstance());
}
