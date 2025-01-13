import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:maxiradiofm/Services/Api_azura.dart';
import 'package:maxiradiofm/pages/home.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AudioPlayer();
  String title = "Cargando...";
  String artist = "Cargando...";
  String albumArt = "";
  String stationName = "MaxiRadioFM";

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    _fetchNowPlaying();
  }

  Future<void> _initializePlayer() async {
    try {
      await player.setUrl("https://server1.maxiradiofm.com:8000/radio.mp3");
    } catch (e) {
      print("Error al cargar el stream: $e");
    }
  }

  Future<void> _fetchNowPlaying() async {
    while (true) {
      try {
        final data = await NowPlayingService.fetchNowPlaying();
        setState(() {
          title = data['now_playing']['song']['title'] ?? "Sin título";
          artist =
              data['now_playing']['song']['artist'] ?? "Artista desconocido";
          albumArt = data['now_playing']['song']['art'] ?? "";
          stationName = data['station']['name'] ?? "MaxiRadioFM";
        });
      } catch (e) {
        print("Error al obtener datos de Now Playing: $e");
      }
      await Future.delayed(
          Duration(seconds: 10)); // Actualizar cada 10 segundos
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen del álbum
            albumArt.isNotEmpty
                ? Image.network(
                    albumArt,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.music_note,
                    size: 200,
                    color: Colors.grey,
                  ),
            const SizedBox(height: 20),
            // Título de la canción
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Artista
            Text(
              artist,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Botones de control
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => player.play(),
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 60,
                  color: customGreen,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () => player.pause(),
                  icon: const Icon(Icons.pause),
                  iconSize: 60,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
