import 'package:flutter/material.dart';

class Track {
  final String trackID;
  String name;
  String artist;
  String album;
  String genre;
  int size;
  int totalTime;
  int year;
  String location;

  Track({
    required this.trackID,
    required this.name,
    required this.artist,
    required this.album,
    required this.genre,
    required this.size,
    required this.totalTime,
    required this.year,
    required this.location,
  });
}

class TrackCrudPage extends StatefulWidget {
  @override
  _TrackCrudPageState createState() => _TrackCrudPageState();
}

class _TrackCrudPageState extends State<TrackCrudPage> {
  List<Track> tracks = [];

  @override
  void initState() {
    super.initState();
    // Initialisiere mit den gegebenen Daten
    tracks = [
      Track(
        trackID: '84760521',
        name: 'Chic Mystique (Lovely Radio Ed)',
        artist: 'Chic',
        album: 'Chic Mystique CD Single',
        genre: 'Rock',
        size: 5714070,
        totalTime: 285,
        year: 2002,
        location:
            'file://localhost/Volumes/Media/Music_F/Music/unsortiert/Helge%201/Chic%20Mystique%20CD%20Single/Chic%20-%20Chic%20Mystique%20(Lovely%20Radio%20Ed.MP3',
      ),
      Track(
        trackID: '254671535',
        name: 'Chic Mystique (Single Without)',
        artist: 'Chic',
        album: 'Chic Mystique CD Single',
        genre: 'Rock',
        size: 4958083,
        totalTime: 247,
        year: 2002,
        location:
            'file://localhost/Volumes/Media/Music_F/Music/unsortiert/Helge%201/Chic%20Mystique%20CD%20Single/Chic%20-%20Chic%20Mystique%20(Single%20Without.MP3',
      ),
      Track(
        trackID: '210369816',
        name: 'Chica',
        artist: 'Culcha Candela',
        album: 'German Top100 Single Charts',
        genre: 'Pop',
        size: 4732073,
        totalTime: 196,
        year: 2008,
        location:
            'file://localhost/Volumes/Media/Music_F/Music/unsortiert2/MPs/mp15/German%20Top%20100%20Single%20Charts%202008-04-14/081-culcha_candela_-_chica-ministry.mp3',
      ),
    ];
  }

  void _createTrack() {
    setState(() {
      tracks.add(
        Track(
          trackID: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'New Track',
          artist: 'Unknown Artist',
          album: 'Unknown Album',
          genre: 'Unknown Genre',
          size: 0,
          totalTime: 0,
          year: DateTime.now().year,
          location: '',
        ),
      );
    });
  }

  void _updateTrack(int index) {
    setState(() {
      tracks[index].name += ' (Updated)';
    });
  }

  void _deleteTrack(int index) {
    setState(() {
      tracks.removeAt(index);
    });
  }

  void _refreshTracks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track CRUD Operations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _createTrack,
                  child: Text('Create'),
                ),
                ElevatedButton(
                  onPressed: _refreshTracks,
                  child: Text('Refresh'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final track = tracks[index];
                return ListTile(
                  title: Text(track.name),
                  subtitle: Text('${track.artist} - ${track.album}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _updateTrack(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTrack(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrackCrudPage(),
  ));
}
