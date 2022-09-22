import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:flutter/material.dart';

class DoctorItemAdmin extends StatelessWidget {
  const DoctorItemAdmin({Key? key, required this.onDeleteTap, required this.onUpdateTap, required this.doctorsItem}) : super(key: key);

  final VoidCallback onDeleteTap;
  final VoidCallback onUpdateTap;
  final DoctorsItem doctorsItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          doctorsItem.doctorImages[0],
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorsItem.doctorName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text("level: ${doctorsItem.level.toString()} years",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
          Text(doctorsItem.specialist,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
          Text(doctorsItem.phoneNumber,style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          )),
          Text(doctorsItem.doctorId,style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          )),

        ],
      ),
      subtitle: Text(
        doctorsItem.description,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        width: 96,
        child: Row(
          children: [
            IconButton(
                onPressed: onUpdateTap,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                )),
            IconButton(
              onPressed: onDeleteTap,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
      shape: const Border(
        bottom: BorderSide(),
      ),
    );
  }
}
