class Track {
  final String trackID;
  final String name;
  final String artist;
  final String album;
  final String genre;
  final int size;
  final int totalTime;
  final int year;
  final String location;

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

import 'package:xml/xml.dart' as xml;

List<Track> parseTracks(String xmlString) {
  final document = xml.XmlDocument.parse(xmlString);
  final tracks = document.findAllElements('TRACK').map((element) {
    return Track(
      trackID: element.getAttribute('TrackID') ?? '',
      name: element.getAttribute('Name') ?? '',
      artist: element.getAttribute('Artist') ?? '',
      album: element.getAttribute('Album') ?? '',
      genre: element.getAttribute('Genre') ?? '',
      size: int.tryParse(element.getAttribute('Size') ?? '0') ?? 0,
      totalTime: int.tryParse(element.getAttribute('TotalTime') ?? '0') ?? 0,
      year: int.tryParse(element.getAttribute('Year') ?? '0') ?? 0,
      location: element.getAttribute('Location') ?? '',
    );
  }).toList();
  return tracks;
}

import 'package:flutter/material.dart';

class TrackListScreen extends StatelessWidget {
  final List<Track> tracks;

  TrackListScreen({required this.tracks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track List'),
      ),
      body: ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (context, index) {
          final track = tracks[index];
          return ListTile(
            title: Text(track.name),
            subtitle: Text('${track.artist} - ${track.album}'),
            trailing: Text('${track.year}'),
            onTap: () {efehl 
            },
          );
        },
      ),
    );
  }
}

void main() {
  final xmlData = '''
    <TRACKS>
      <TRACK TrackID="84760521" Name="Chic Mystique (Lovely Radio Ed" Artist="Chic"
             Album="Chic Mystique CD Single" Genre="Rock" Size="5714070" TotalTime="285" Year="2002"
             Location="file://localhost/Volumes/Media/Music_F/Music/unsortiert/Helge%201/Chic%20Mystique%20CD%20Single/Chic%20-%20Chic%20Mystique%20(Lovely%20Radio%20Ed.MP3"/>
      <TRACK TrackID="254671535" Name="Chic Mystique (Single Without" Artist="Chic"
             Album="Chic Mystique CD Single" Genre="Rock" Size="4958083" TotalTime="247" Year="2002"
             Location="file://localhost/Volumes/Media/Music_F/Music/unsortiert/Helge%201/Chic%20Mystique%20CD%20Single/Chic%20-%20Chic%20Mystique%20(Single%20Without.MP3"/>
      <TRACK TrackID="210369816" Name="Chica" Artist="Culcha Candela" Album="German Top100 Single Charts"
             Genre="Pop" Size="4732073" TotalTime="196" Year="2008"
             Location="file://localhost/Volumes/Media/Music_F/Music/unsortiert2/MPs/mp15/German%20Top%20100%20Single%20Charts%202008-04-14/081-culcha_candela_-_chica-ministry.mp3"/>
    </TRACKS>
  ''';

  final tracks = parseTracks(xmlData);

  runApp(MaterialApp(
    home: TrackListScreen(tracks: tracks),
  ));
}

