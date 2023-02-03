import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pepcorns_llp/core/api/web_services.dart';
import 'package:pepcorns_llp/model/general_model.dart';
import 'package:pepcorns_llp/model/users.dart';

import 'web_services_test.mocks.dart';

@GenerateMocks([
  WebServices,
])
void main() {
  late WebServices webServices;

  setUp(() {
    webServices = MockWebServices();
  });

  test('get all users without any error', () async {
    ///Arrange
    final list = List.generate(
      6,
      (index) => GeneralModel(
        userId: 'userID$index',
        name: 'name$index',
        age: index,
      ),
    );
    final expectedUsers = Users(response: list);

    when(webServices.getAllUsers()).thenAnswer(
      (_) {
        return Future.value(expectedUsers);
      },
    );

    ///Act
    final result = await webServices.getAllUsers();

    ///Assert
    expect(result, expectedUsers);
  });
}
