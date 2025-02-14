import 'package:define_digitals/data/models/saving_model.dart';
import 'package:hive/hive.dart';

class SavingsModelAdapter extends TypeAdapter<SavingsModel> {
  @override
  final int typeId = 0;

  @override
  SavingsModel read(BinaryReader reader) {
    return SavingsModel(
      compA: reader.readDouble(),
      compB: reader.readDouble(),
      year: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, SavingsModel obj) {
    writer.writeDouble(obj.compA);
    writer.writeDouble(obj.compB);
    writer.writeInt(obj.year);
  }
}
