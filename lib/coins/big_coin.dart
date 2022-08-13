import 'package:bonfire/bonfire.dart';
import 'package:pocman_game/player/pocman.dart';
import '../main.dart';
import '../spriteSheets/big_coin_sprite_sheet.dart';

class BigCoin extends GameDecoration with Sensor {
  BigCoin(Vector2 position)
      : super.withSprite(
          sprite: BigCoinSpriteSheet.bigCoin,
          position: position,
          size: Vector2(8, 8),
        ) {
    setupSensorArea(
        areaSensor: [CollisionArea.circle(radius: 2, align: Vector2(2.8, 3))]);
  }

  @override
  void onContact(GameComponent component) {
    if (isScared && component is Pocman) {
      timer = 200;
    }
    if (component is Pocman) {
      score += 100;
      isScared = true;
      removeFromParent();
    } else {
      return;
    }
  }
}
