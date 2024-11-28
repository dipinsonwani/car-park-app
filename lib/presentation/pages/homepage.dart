import 'package:car_park_app/data/models/car_model.dart';
import 'package:car_park_app/helper.dart';
import 'package:car_park_app/presentation/blocs/car_bloc.dart';
import 'package:car_park_app/presentation/blocs/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<CarCubit>().fetchAllCheckedInCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Park App'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<CarCubit, CarState>(listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('An error occured')));
              }
            }, builder: (context, state) {
              if (state.carList.isNotEmpty) {
                final cars = state.carList;
                return ListView.builder(
                    itemCount: state.carList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cars[index].carNumber),
                        subtitle:
                            Text(cars[index].checkInTime.toCustomFormat()),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<CarCubit>().checkOutCar(
                                  cars[index].copyWith(
                                    checkOutTime: DateTime.now(),
                                  ),
                                );
                          },
                          icon: const Icon(Icons.outbond),
                        ),
                      );
                    });
              } else {
                return const Text('Parking lot Empty');
              }
            })),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: ReactiveFormBuilder(
                          form: _form,
                          builder: (_, form, child) {
                            return Column(
                              children: [
                                ReactiveTextField(
                                  keyboardType: TextInputType.text,
                                  validationMessages: {
                                    ValidationMessage.pattern: (_) =>
                                        'Please add a valid number plate'
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Enter Car Number'),
                                  formControlName: 'car_number',
                                ),
                                const SizedBox(height: 20),
                                ReactiveFormConsumer(
                                    builder: (_, form, child) => ElevatedButton(
                                        onPressed: !form.valid
                                            ? null
                                            : () {
                                                context
                                                    .read<CarCubit>()
                                                    .checkInCar(CarModel(
                                                        form.value['car_number']
                                                            .toString()
                                                            .toUpperCase(),
                                                        DateTime.now(),
                                                        null));
                                                Navigator.of(context).pop();
                                                context
                                                    .read<CarCubit>()
                                                    .fetchAllCheckedInCars();
                                              },
                                        child: const Text('Submit')))
                              ],
                            );
                          }),
                    ),
                  );
                });
          }),
    );
  }

  static const String indianNumberPlatePattern =
      r'^[A-Za-z]{2}[0-9]{1,2}[A-Za-z]{1,2}[0-9]{4}$';

  FormGroup _form() => fb.group({
        'car_number': FormControl<String>(
          validators: [
            Validators.required,
            Validators.pattern(RegExp(indianNumberPlatePattern))
          ],
        ),
      });
}
