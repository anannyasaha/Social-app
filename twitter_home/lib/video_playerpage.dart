/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class video_player_screen extends StatefulWidget {
  var tweet;
  video_player_screen({Key key,this.tweet}) : super(key: key);

  @override
  _video_player_screenState createState() => _video_player_screenState();
}

class _video_player_screenState extends State<video_player_screen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(25.0);
    super.initState();
    setState(() {

    });
  }
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.tweet.userLongName),
      ),

      body: FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print("video!!!!!");
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return VideoPlayer(_controller);



        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    // Wrap the play or pause in a call to `setState`. This ensures the
    // correct icon is shown.
    setState(() {
    // If the video is playing, pause it.
    if (_controller.value.isPlaying) {
    _controller.pause();
    } else {
    // If the video is paused, play it.
    _controller.play();
    }
    });
    },
    // Display the correct icon depending on the state of the player.
    child: Icon(
    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    ),
    ), // This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}
*/