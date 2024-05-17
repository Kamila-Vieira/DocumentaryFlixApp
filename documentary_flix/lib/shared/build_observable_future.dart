import 'future_store.dart';
import 'package:flutter/material.dart';

Widget buildObservableFuture({
  required Widget resultComponent,
  required FutureStore futureStore,
  required String emptyMessage,
  required String loadingMessage,
  required String errorMessage,
}) {
  if (futureStore.futureState == FutureState.loading) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(loadingMessage),
          ),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }

  if (futureStore.errorMessage != null) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(child: Text(errorMessage)),
    );
  }

  if ((futureStore.data?.length ?? 0) == 0) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(child: Text(emptyMessage)),
    );
  }

  return resultComponent;
}
