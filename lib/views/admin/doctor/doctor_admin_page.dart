import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:firebase_auth_part/utils/constanta.dart';
import 'package:firebase_auth_part/view_models/doctor_view_model.dart';
import 'package:firebase_auth_part/views/admin/doctor/widgets/doctor_item_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorAdminPage extends StatelessWidget {
  const DoctorAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, addDoctor),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: StreamBuilder<List<DoctorsItem>>(
        stream: context.read<DoctorViewModel>().getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final doctors = snapshot.data!;
            return doctors.isNotEmpty
                ? ListView(
                    children: List.generate(
                        doctors.length,
                        (index) => DoctorItemAdmin(
                              onDeleteTap: () {
                                context.read<DoctorViewModel>().deleteDoctor(
                                      context: context,
                                      docId: doctors[index].doctorId,
                                    );
                              },
                              onUpdateTap: () {
                                // => Navigator.pushNamed(
                                //   context,
                                //   updateCategory,
                                //   arguments: UpdateCategoryArgs(
                                //     categoryItem: doctors[index],
                                //     docId: doctors[index].categoryId,
                                //   ),
                                // ),
                              },
                              doctorsItem: doctors[index],
                            )),
                  )
                : const Center(
                    child: Text("no Doctors"),
                  );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
