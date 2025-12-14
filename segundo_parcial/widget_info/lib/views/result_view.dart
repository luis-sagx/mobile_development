import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/satellite_controller.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the view initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SatelliteController>().fetchSatellites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NASA Small-Body Satellites')),
      body: Consumer<SatelliteController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          if (controller.satelliteResponse == null ||
              controller.satelliteResponse!.data == null) {
            return const Center(child: Text('No data available'));
          }

          final satellites = controller.satelliteResponse!.data!;

          return ListView.builder(
            itemCount: satellites.length,
            itemBuilder: (context, index) {
              final satData = satellites[index];
              final sat = satData.sat;

              if (sat == null) return const SizedBox.shrink();

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(sat.satFullname ?? sat.iauName ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (sat.provYear != null) Text('Year: ${sat.provYear}'),
                      if (sat.satClass != null) Text('Class: ${sat.satClass}'),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
