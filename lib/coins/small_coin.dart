import 'package:bonfire/bonfire.dart';
import 'package:pocman_game/player/pocman.dart';
import 'package:pocman_game/spriteSheets/small_coin_sprite_sheet.dart';
import '../main.dart';

class SmallCoin extends GameDecoration with Sensor {
  SmallCoin(Vector2 position)
      : super.withSprite(
          sprite: SmallCoinSpriteSheet.smallCoin,
          position: position,
          size: Vector2(8, 8),
        ) {
    setupSensorArea(areaSensor: [
      CollisionArea.circle(radius: 1.5, align: Vector2(2.8, 3))
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Pocman) {
      score += 10;
      removeFromParent();
    } else {
      return;
    }
  }
}
