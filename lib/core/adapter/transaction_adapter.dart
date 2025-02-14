import 'package:define_digitals/data/models/transaction_model.dart';
import 'package:hive/hive.dart';

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 1;

  @override
  TransactionModel read(BinaryReader reader) {
    return TransactionModel(
      amount: reader.readDouble(),
      component: reader.readString(),
      year: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer.writeDouble(obj.amount);
    writer.writeString(obj.component);
    writer.writeInt(obj.year);
  }
}
