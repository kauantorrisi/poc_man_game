import 'package:bonfire/bonfire.dart';
import 'package:pocman_game/enemies/blue_ghost.dart';
import 'package:pocman_game/enemies/green_ghost.dart';
import 'package:pocman_game/enemies/red_ghost.dart';
import 'package:pocman_game/enemies/yellow_ghost.dart';
import 'package:pocman_game/main.dart';
import '../spriteSheets/player_sprite_sheet.dart';

class Pocman extends SimplePlayer with ObjectCollision {
  Pocman(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
              idleLeft: PlayerSpriteSheet.pocmanLeft,
              idleRight: PlayerSpriteSheet.pocmanRight,
              idleDown: PlayerSpriteSheet.pocmanDown,
              idleUp: PlayerSpriteSheet.pocmanUp,
              runRight: PlayerSpriteSheet.pocmanRight,
              runDown: PlayerSpriteSheet.pocmanDown,
              runLeft: PlayerSpriteSheet.pocmanLeft,
              runUp: PlayerSpriteSheet.pocmanUp),
          size: Vector2(tileSize, tileSize),
          speed: 30,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(radius: 4),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (isScared == false && component is BlueGhost ||
        isScared == false && component is GreenGhost ||
        isScared == false && component is RedGhost ||
        isScared == false && component is YellowGhost) {
      died = true;
      removeFromParent();
      score = 0;
    }

    return super.onCollision(component, active);
  }
}
