import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_trafik_kurallari/oyun_trafik_kurallari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(trafikKurallariConfig.title.length, 33);
    expect(trafikKurallariConfig.tagline.length, 33);
    for (final s in trafikKurallariConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(trafikKurallariConfig.gameId, trafikKurallariId);
    expect(trafikKurallariRules.gameId, trafikKurallariId);
    expect(trafikKurallariConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(trafikKurallariRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: trafikKurallariId, optionalMechanics: trafikKurallariRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(trafikKurallariRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
