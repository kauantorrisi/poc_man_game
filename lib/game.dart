import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pocman_game/interface/interface.dart';
import 'coins/big_coin.dart';
import 'coins/small_coin.dart';
import 'controller/my_game_controller.dart';
import 'enemies/blue_ghost.dart';
import 'enemies/green_ghost.dart';
import 'enemies/red_ghost.dart';
import 'enemies/yellow_ghost.dart';
import 'main.dart';
import 'player/pocman.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.yellowAccent,
        ),
        keyboardConfig: KeyboardConfig(),
      ),
      map: TiledWorldMap(
        'map/pocman_map.json',
        objectsBuilder: {
          'blueGhost': (properties) => BlueGhost(properties.position),
          'greenGhost': (properties) => GreenGhost(properties.position),
          'yellowGhost': (properties) => YellowGhost(properties.position),
          'redGhost': (properties) => RedGhost(properties.position),
          'small_coin': (properties) => SmallCoin(properties.position),
          'big_coin': (properties) => BigCoin(properties.position),
        },
      ),
      components: [
        MyGameController(),
      ],
      player: Pocman(Vector2(0.25 * tileSize, 0.25 * tileSize)),
      overlayBuilderMap: {
        Interface.overlayKey: ((context, game) => Interface(game: game))
      },
      initialActiveOverlays: const [
        Interface.overlayKey,
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 5,
      ),
    );
  }
}
