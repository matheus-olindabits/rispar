import 'package:rispar_project/app/modules/simulation/repository/simulation_repository.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/proposal_received.dart';
import 'package:rispar_project/app/modules/simulation/shared/models/simulation.dart';

class SimulationService {

  SimulationRepository simulationRepository = SimulationRepository();

  Future<ProposalReceived> sendSimulation(Simulation simulation) async {
    try {
      return await simulationRepository.sendSimulation(simulation);
    } catch (error) {
      rethrow;
    }
  }

}