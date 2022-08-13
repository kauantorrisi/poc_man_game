import 'package:bonfire/bonfire.dart';

class RedGhostSpriteSheet {
  static Future<SpriteAnimation> get redGhostRight => SpriteAnimation.load(
        'enemies/redGhost/redGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get redGhostLeft => SpriteAnimation.load(
        'enemies/redGhost/redGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get redGhostUp => SpriteAnimation.load(
        'enemies/redGhost/redGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get redGhostDown => SpriteAnimation.load(
        'enemies/redGhost/redGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );
}
