import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomVideoPlayerWidget extends StatefulWidget {
  final String url;
  final bool? autoPlay;
  final double? aspectRatio;
  final bool enableTimeIndicator;
  final bool tapToPlayPause;
  final bool isPlaying;

  const CustomVideoPlayerWidget(
    this.url, {
    super.key,
    this.autoPlay,
    this.aspectRatio,
    this.enableTimeIndicator = false,
    this.tapToPlayPause = true,
    this.isPlaying = false,
  });

  @override
  State<CustomVideoPlayerWidget> createState() =>
      CustomVideoPlayerWidgetState();
}

class CustomVideoPlayerWidgetState extends State<CustomVideoPlayerWidget>
    with WidgetsBindingObserver {
  VideoPlayerController? _controller;
  bool initialized = false;
  double? aspectRatio;
  bool isYoutube = false;
  bool isVideoAvailable = true;

  late YoutubePlayerController _youtubeController;

  Timer? _timer;

  void _cancelTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  Future<void> initVideoController() async {
    final uri = Uri.parse(widget.url);
    _controller = VideoPlayerController.networkUrl(uri);
    await _controller!.initialize();
    await _controller!.setLooping(true).then(
      (_) {
        if (mounted) {
          setState(() {
            initialized = true;
            aspectRatio = widget.aspectRatio ?? _controller?.value.aspectRatio;
          });
          if (widget.autoPlay == true) {
            _controller?.play();
            return;
          }
          if (widget.isPlaying) {
            _controller?.play();
          } else {
            _controller?.pause();
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (widget.url.contains('youtu.be') || widget.url.contains('youtube')) {
      isYoutube = true;
      final videoId = YoutubePlayerController.convertUrlToId(widget.url);

      if (videoId == null) {
        isVideoAvailable = false;
        if (mounted) {
          setState(() {});
        }
        return;
      }

      _youtubeController = YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: widget.autoPlay ?? false,
        params: const YoutubePlayerParams(
          showControls: false,
          strictRelatedVideos: true,
          pointerEvents: PointerEvents.none,
          loop: true,
          showFullscreenButton: false,
          showVideoAnnotations: false,
          enableCaption: false,
        ),
      );
      return;
    }

    // Video player supports web version but I still disable it
    initVideoController();
    _controller?.addListener(_listener);
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    if (!isYoutube) {
      _controller?.removeListener(_listener);
      _controller?.dispose();
    } else {
      _youtubeController.close();
    }
    WidgetsBinding.instance.removeObserver(this);
    _cancelTimer();
    super.dispose();
  }

  Widget playPauseButton(bool isPlaying) {
    return isPlaying
        ? const SizedBox.shrink()
        : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                CupertinoIcons.play_arrow_solid,
                color: Colors.white,
                size: 50.0,
                semanticLabel: 'Play',
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    if (!isYoutube) {
      if (initialized && _controller != null) {
        return VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction == 0) {
              _controller?.pause();
            }
          },
          key: ValueKey('mp4_player_iframe-${widget.url}'),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: AspectRatio(
                aspectRatio: aspectRatio ?? _controller!.value.aspectRatio,
                child: Listener(
                  onPointerUp: (_) {
                    if (widget.tapToPlayPause) {
                      if (_controller!.value.isPlaying) {
                        _controller!.pause();
                      } else {
                        _controller!.play();
                      }
                    }
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'video',
                        transitionOnUserGestures: true,
                        child: VideoPlayer(_controller!),
                      ),
                      if (widget.tapToPlayPause)
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 50),
                          reverseDuration: const Duration(milliseconds: 200),
                          child: playPauseButton(_controller!.value.isPlaying),
                        ),
                      if (widget.enableTimeIndicator)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: VideoProgressIndicator(_controller!,
                              allowScrubbing: true),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }

      return Container(
        height: MediaQuery.of(context).size.width * 0.8,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return VisibilityDetector(
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          _youtubeController.pauseVideo();
        }
      },
      key: ValueKey('youtube_player_iframe-${widget.url}'),
      child: Listener(
        onPointerUp: (_) async {
          if (widget.tapToPlayPause) {
            var playerState = await _youtubeController.playerState;
            if (playerState == PlayerState.playing) {
              await _youtubeController.pauseVideo();
            } else {
              await _youtubeController.playVideo();
            }
          }
        },
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: YoutubePlayer(
                controller: _youtubeController,
                aspectRatio: aspectRatio ?? 16 / 9,
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.width,
            child: YoutubePlayerControllerProvider(
              controller: _youtubeController,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: YoutubePlayer(
                      controller: _youtubeController,
                      aspectRatio: aspectRatio ?? 16 / 9,
                    ),
                  ),
                  if (widget.tapToPlayPause)
                    Positioned.fill(
                      child: YoutubeValueBuilder(
                        builder: (context, value) {
                          return playPauseButton(
                              value.playerState == PlayerState.playing);
                        },
                      ),
                    ),
                  if (widget.enableTimeIndicator)
                    const Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: VideoPositionSeeker(),
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class VideoPositionSeeker extends StatelessWidget {
  ///
  const VideoPositionSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 0.0;

    return StreamBuilder<Duration>(
      // fixme: getCurrentPositionStream
      // stream: context.ytController.getCurrentPositionStream(),
      initialData: Duration.zero,
      builder: (context, snapshot) {
        final position = snapshot.data?.inSeconds ?? 0;
        final duration = context.ytController.metadata.duration.inSeconds;

        value = position == 0 || duration == 0 ? 0 : position / duration;

        return StatefulBuilder(
          builder: (context, setState) {
            return Slider(
              activeColor: const Color.fromRGBO(255, 0, 0, 0.7),
              value: value,
              onChanged: (positionFraction) {
                value = positionFraction;
                setState(() {});

                context.ytController.seekTo(
                  seconds: (value * duration).toDouble(),
                  allowSeekAhead: true,
                );
              },
              min: 0,
              max: 1,
            );
          },
        );
      },
      stream: null,
    );
  }
}
