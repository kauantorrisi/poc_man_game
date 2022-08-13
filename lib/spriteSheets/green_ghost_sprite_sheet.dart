import 'package:bonfire/bonfire.dart';

class GreenGhostSpriteSheet {
  static Future<SpriteAnimation> get greenGhostRight => SpriteAnimation.load(
        'enemies/greenGhost/greenGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get greenGhostLeft => SpriteAnimation.load(
        'enemies/greenGhost/greenGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get greenGhostUp => SpriteAnimation.load(
        'enemies/greenGhost/greenGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get greenGhostDown => SpriteAnimation.load(
        'enemies/greenGhost/greenGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );
}
