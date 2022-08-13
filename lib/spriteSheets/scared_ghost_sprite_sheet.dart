import 'package:bonfire/bonfire.dart';

class ScaredGhostSpriteSheet {
  static Future<SpriteAnimation> get scaredGhost => SpriteAnimation.load(
        'enemies/scaredGhost/scaredGhost.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );
}
