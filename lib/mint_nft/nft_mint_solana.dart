import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:ai_muse/keys.dart';
import 'package:http/http.dart' as http;
import 'package:bs58check/bs58check.dart' as bs58check;
// import 'package:solana/encoder.dart';
// import 'package:solana/solana.dart';
// import 'package:solana/src/crypto/ed25519_hd_keypair.dart';

import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:solana_web3/programs/system.dart' as web3Program;

// Replace with your Solana wallet address
String walletAddress = SOLANA_WALLET_PUBLIC_KEY;

// Replace with your Solana wallet secret key
String walletKey = SOLANA_WALLET_PRIVATE_KEY;

// Replace with your NFT metadata URL
String metadataUrl =
    "https://ipfs.io/ipfs/bafybeightino5tboparqeeolafpaqxkkbzn6wtw3laby4qmkz6ecmeu2ge/cube_lady.json";

// Replace with your mint address
String mintAddress = SOLANA_WALLET_AI_MUSE_PUBLIC_KEY;

// Replace with the number of NFTs to mint
int numTokens = 1;

Future<void> mintNFT() async {
  var client = http.Client();

  // Build the JSON payload
  Map<String, dynamic> payload = {
    'jsonrpc': '2.0',
    'id': 1,
    'method': 'simulateTransaction',
    'params': [
      {
        'message': {
          'accountKeys': [
            walletAddress,
          ],
          'instructions': [
            {
              'programId': 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA',
              'keys': [
                {
                  'pubkey': mintAddress,
                  'isSigner': false,
                  'isWritable': true,
                },
                {
                  'pubkey': walletAddress,
                  'isSigner': true,
                  'isWritable': true,
                },
              ],
              'data': metadataUrl,
            },
          ],
        },
        'signatures': [],
      },
      {'commitment': 'recent'},
    ],
  };

  // Sign the payload with the wallet secret key
  var data = json.encode(payload);
  // var bytes = utf8.encode(data);
  // var keyPair = Ed25519HDKeyPair.fromPrivateKeyBytes(
  //     privateKey: bs58check.decode(walletKey));
  log("1");

  Uint8List byte =
      Uint8List.fromList(SOLANA_WALLET_MAC_CLI_AI_MUSE_PRIVATE_KEY);
  log("2");
  // var signature = await keyPair.sign(bytes);

  // Add the signature to the payload
  payload['params'][0]['signatures'] = [bs58check.encode(byte)];

  // Send the HTTP request
  var uri = Uri.parse('https://api.devnet.solana.com');
  var response = await client.post(
    uri,
    headers: {'Content-Type': 'application/json'},
    body: data,
  );

  // Print the response
  print(response.body);

  // Close the HTTP client
  client.close();
}

Future<String?> mintOnSolanaWeb3() async {
  // Create a connection to the devnet cluster.
  final cluster = web3.Cluster.devnet;
  final connection = web3.Connection(cluster);

  // Create a wallet to transfer tokens from.
  print('Connecting account 1 \n');
  final wallet1 = web3.Keypair.fromSecretKeySync(
      Uint8List.fromList(SOLANA_WALLET_MAC_CLI_PRIVATE_KEY));
  final address1 = wallet1.publicKey;

  print('Connecting account 2 \n');
  final wallet2 = web3.Keypair.fromSecretKeySync(
      Uint8List.fromList(SOLANA_WALLET_MAC_CLI_AI_MUSE_PRIVATE_KEY));
  final address2 = wallet1.publicKey;

  // Create a System Program instruction to transfer 1 SOL from [address1] to [address2].
  final transaction = web3.Transaction();
  transaction.add(
    web3Program.SystemProgram.transfer(
      fromPublicKey: address1,
      toPublicKey: address2,
      lamports: web3.solToLamports(1),
    ),
  );

  // Send the transaction to the cluster and wait for it to be confirmed.
  print('Send and confirm transaction...\n');
  final result = await connection.sendAndConfirmTransaction(
    transaction,
    signers: [wallet2], // Fee payer + transaction signer.
  );
  log(result);
}

// Future<String?> mintOnSolana(
//     {required String jsonUrl, required Map<String, String> metadata}) async {
//   try {
//     // Replace the values below with your own

//     const mintAddress = SOLANA_WALLET_MAC_CLI_AI_MUSE_PUBLIC_KEY;
//     const recipientAddress = SOLANA_WALLET_MAC_CLI_PUBLIC_KEY;

//     // Initialize a Solana client
//     final client = SolanaClient(
//         rpcUrl: Uri.parse("https://api.devnet.solana.com"),
//         websocketUrl: Uri.parse("wss://api.devnet.solana.com"));
//     log("done 1");

//     // Create the instruction to transfer the NFT
//     final metadata = [
//       {"trait_type": "name", "value": "test_name"},
//       {"trait_type": "description", "value": "test_description"}
//     ];

//     final seed1 = Uint8List.fromList(SOLANA_WALLET_MAC_CLI_PRIVATE_KEY);
//     final seed2 = Uint8List.fromList(SOLANA_WALLET_MAC_CLI_AI_MUSE_PRIVATE_KEY);
//     final keyPairMacCli = await Ed25519HDKeyPair.fromSeedWithHdPath(
//         seed: seed1, hdPath: "m/44'/501'");
//     final keyPairAIMuse = await Ed25519HDKeyPair.fromSeedWithHdPath(
//         seed: seed2, hdPath: "m/44'/501'");
//     log("1: ${keyPairMacCli.address}, 2: ${keyPairAIMuse.address}");
//     final transferInstruction = await client.sendAndConfirmTransaction(
//       signers: [keyPairAIMuse],
//       commitment: Commitment.processed,
//       message: Message(instructions: [
//         Instruction(
//             programId: Ed25519HDPublicKey.fromBase58(mintAddress),
//             accounts: [
//               AccountMeta(
//                   pubKey: Ed25519HDPublicKey.fromBase58(recipientAddress),
//                   isWriteable: true,
//                   isSigner: false),
//             ],
//             data: ByteArray.fromString(metadata.toString()))
//       ]),
//     );
//     log("done 2");
//     return transferInstruction;
//   } catch (e) {
//     log(e.toString());
//   }
// }
