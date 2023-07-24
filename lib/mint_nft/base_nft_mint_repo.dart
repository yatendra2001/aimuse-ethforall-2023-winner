abstract class BaseNFTMintRepo {
  Future<String?> generateImageFromAI({required String prompt});

  Future<String> storeFileInDirectory(
      {required String url,
      required String title,
      required String description});

  Future<String> uploadImageToIPFS(
      {required String imageUrl,
      required String walletAddress,
      required String nftName,
      required String description,
      required Map<String, String> traitsDescription});

  Future<void> mintNFTUsingAPI(
      {required String chain,
      // ignore: non_constant_identifier_names
      required String NFT_Name,
      // ignore: non_constant_identifier_names
      required String NFT_Description,
      required String mintingAddress,
      required String imageURL});

  Future<void> mintNFTOnSolana(
      {required String name, required String symbol, required String imageUrl});
}
