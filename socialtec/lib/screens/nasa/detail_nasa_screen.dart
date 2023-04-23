import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:socialtec/models/nasa_model.dart';
import 'package:lottie/lottie.dart';

class DetailNasaScreen extends StatefulWidget {
  const DetailNasaScreen(
      {super.key, required this.nasaModel, required this.tipo, required this.scale});

  final NasaModel nasaModel;
  final String tipo;
  final double scale;

  @override
  State<DetailNasaScreen> createState() => _DetailNasaScreenState();
}

class _DetailNasaScreenState extends State<DetailNasaScreen> {
  
  late PhotoViewControllerBase controller;
  late PhotoViewScaleStateController scaleStateController;
  int calls = 0;

  @override
  void initState() {
    controller = PhotoViewController(initialScale: widget.scale)
      ..outputStateStream.listen(onController);

    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);
    super.initState();
  }

  void onController(PhotoViewControllerValue value) {
    setState(() {
      calls += 1;
    });
  }

  void onScaleState(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fecha = widget.nasaModel.date!.split(" ")[0];
    String anio = fecha.split("-")[0];
    String mes = fecha.split("-")[1];
    String dia = fecha.split("-")[2];
    print("fecha => $fecha");
    print('https://api.nasa.gov/EPIC/archive/${widget.tipo}/$anio/$mes/$dia/png/${widget.nasaModel.image!}.png?api_key=ut9N5GCDqEZI6KTzNkCdFIOtD1hev0cCN1xp2AYs');
    double res = MediaQuery.of(context).size.width / 2;
    print("res -> $res");
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.image_search_rounded,
            color: Colors.orange,
          ),
          Text(
            " ${widget.nasaModel.identifier!}",
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
        ],
      )),
      body: ClipRect(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: PhotoView(
                loadingBuilder: (context, progress) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                imageProvider: NetworkImage(
                    'https://api.nasa.gov/EPIC/archive/${widget.tipo}/$anio/$mes/$dia/png/${widget.nasaModel.image!}.png?api_key=ut9N5GCDqEZI6KTzNkCdFIOtD1hev0cCN1xp2AYs'),
                controller: controller,
                scaleStateController: scaleStateController,
                enableRotation: true,
                initialScale: widget.scale,
                minScale: 0.01,
                maxScale: widget.scale * 3,
                basePosition: FractionalOffset.topCenter,
              ),
            ),
            IgnorePointer(child: Lottie.asset("assets/animation/bg_1.json", width: double.infinity,)),
            Positioned(
              bottom: 0,
              height: 280,
              left: 0,
              right: 0,
              child: Container(
                //padding: const EdgeInsets.all(30.0),
                child: StreamBuilder(
                  stream: controller.outputStateStream,
                  initialData: controller.value,
                  builder: _streamBuild,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _streamBuild(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError || !snapshot.hasData) {
      return Container();
    }
    final PhotoViewControllerValue value = snapshot.data;
    return Column(
      children: <Widget>[
        Text(
          "Image date: ${widget.nasaModel.date!.split(' ')[0]}\n",
          style: const TextStyle(
            fontSize: 17,
            color: Colors.orange,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        Text(
          "Rotation ${value.rotation}",
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.orange,
            thumbColor: Colors.orange,
          ),
          child: Slider(
            value: value.rotation.clamp(pi * -2, pi * 2),
            min: pi * -2,
            max: pi * 2,
            onChanged: (double newRotation) {
              controller.rotation = newRotation;
            },
          ),
        ),
        Text(
          "Scale ${value.scale}",
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.orange,
            thumbColor: Colors.orange,
          ),
          child: Slider(
            value: value.scale!.clamp(0.01, widget.scale * 3),
            min: 0.01,
            max: widget.scale * 3,
            onChanged: (double newScale) {
              controller.scale = newScale;
            },
          ),
        ),
        Text(
          "Position ${value.position.dx}",
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.orange,
            thumbColor: Colors.orange,
          ),
          child: Slider(
            value: value.position.dx,
            min: -1000.0,
            max: 1000.0,
            onChanged: (double newPosition) {
              controller.position = Offset(newPosition, controller.position.dy);
            },
          ),
        ),
      ],
    );
  }
}
