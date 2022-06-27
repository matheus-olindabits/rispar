import 'dart:convert';
import 'package:rispar_project/app/core/dio/custom_dio.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/proposal_received.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/simulation.dart';

class SimulationRepository {

  Future<ProposalReceived> sendSimulation(Simulation simulation) {
    return CustomDio.authInstance
        .post('/acquisition/simulation', data: simulation.toMap())
        .then((res) {
      return ProposalReceived.fromJson(json.encode(res.data));
    });
  }

}