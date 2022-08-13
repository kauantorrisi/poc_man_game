import 'package:bonfire/bonfire.dart';

class YellowGhostSpriteSheet {
  static Future<SpriteAnimation> get yellowGhostRight => SpriteAnimation.load(
        'enemies/yellowGhost/yellowGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get yellowGhostLeft => SpriteAnimation.load(
        'enemies/yellowGhost/yellowGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get yellowGhostUp => SpriteAnimation.load(
        'enemies/yellowGhost/yellowGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get yellowGhostDown => SpriteAnimation.load(
        'enemies/yellowGhost/yellowGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );
}
