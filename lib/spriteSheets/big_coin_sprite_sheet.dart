import 'package:bonfire/bonfire.dart';

class BigCoinSpriteSheet {
  static Future<Sprite> get bigCoin => Sprite.load(
        'collectibles/BigCoin.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(16, 16),
      );
}
