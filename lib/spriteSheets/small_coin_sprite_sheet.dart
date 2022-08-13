import 'package:bonfire/bonfire.dart';

class SmallCoinSpriteSheet {
  static Future<Sprite> get smallCoin => Sprite.load(
        'collectibles/Coin.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(16, 16),
      );
}
