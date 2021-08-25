abstract class ICloudFirestoreRemote {
  Future<void> init();
  Future<List<Map<String, dynamic>>> getAllFromCollection(String collection);
}
