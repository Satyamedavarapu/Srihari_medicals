import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';

typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorWidgetBuilder = Widget Function(
    BuildContext context, dynamic error);
typedef LoadingWidgetBuilder = Widget Function(BuildContext context);

class StreamHandlerWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final DataWidgetBuilder<T> dataBuilder;
  final ErrorWidgetBuilder? errorBuilder;
  final LoadingWidgetBuilder? loadingBuilder;
  final Function() retryCallback;

  const StreamHandlerWidget(
      {super.key,
      required this.stream,
      required this.dataBuilder,
      required this.retryCallback,
      this.errorBuilder,
      this.loadingBuilder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataBuilder(context, snapshot.data!);
          } else if (snapshot.hasError) {
            return errorBuilder != null
                ? errorBuilder!(context, snapshot.error)
                : Text('${snapshot.error}');
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                return loadingBuilder != null
                    ? loadingBuilder!(context)
                    : Material(
                        color: Colors.white,
                        child: Center(
                            child:
                                SpinKitCubeGrid(color: context.appBarGreen)));
              default:
                return Container();
            }
          }
        });
  }
}
