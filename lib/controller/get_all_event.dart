import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http; // Import the http package.
import '../apis/fetchData.dart';
import '../data_model/get_all_event_data_model.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var listOfData = <GetEvent>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    try {
      isLoading(true);

      var data = await GetData().fetchDataFromApi(); // Wait for the API call to complete.

      listOfData.addAll(data as Iterable<GetEvent>);
    } catch (e) {
      print("Error: $e"); // Handle errors by logging them.
      // You can also display an error message to the user if needed.
    } finally {
      isLoading(false);
    }
  }
}
