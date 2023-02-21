## AI Muse 


AI Muse, aims to revolutionize the NFT market by empowering users to easily create and sell their digital assets, encouraging more artists and collectors to participate in the NFT space.

![Group 6](https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2Fcover_pic.png?alt=media&token=09b04d90-0969-413e-87dc-9dbe1fdf81ec)

<img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F1.jpg?alt=media&token=dfc84456-4e15-49d4-bd9f-9baffb10da3a" width=250> <img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F2.jpg?alt=media&token=0563bea0-5c67-4c82-aa67-481a8260e2cf" width=250> <img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F3.jpg?alt=media&token=06b2162a-a579-433d-bad7-62309b858810" width=250> <img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F4.jpg?alt=media&token=c84767da-be92-4ffd-b7c4-ad104e08ebaf" width=250> <img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F5.jpg?alt=media&token=ddcc773e-4527-4693-a2bc-ef4e01d4b2ff" width=250> <img src="https://firebasestorage.googleapis.com/v0/b/pikc-scanner.appspot.com/o/aimuse%2F6.jpg?alt=media&token=6ac4d38a-ed9a-4049-b0ab-a14c205195f8" width=250>

## Introduction

AI Muse is an NFT generator mobile application that utilizes AI algorithms and prompts to simplify the NFT creation process, making it accessible to a wider audience. The AI-generated artwork is unique and reflects the personal preferences and styles of the user, resulting in one-of-a-kind NFTs.

## Usage

1. Clone the repository from GitHub:

```bash
git clone https://github.com/yatendra2001/ai_muse.git
```

2. Create a file keys.dart under lib directory and get the following keys:

```bash
const DALL_E_API = "***get_api_key_from_OpenAI_DALL-E***";
const NFT_STORAGE_API =
    "***get_api_key_from_NFT.Storage***";
const NFT_PORT_API = "***get_api_key_from_NFTPort.xyz***";
const CONTRACT_NAME = "Name you want to give to your contract";
const CONTRACT_SYMBOL = "*****give_your_own_token_symbol_like_AMC******";
const CONTRACT_ADDRESS = <Follow below step 3 and 4 for this>;
const CONTRACT_ADDRESS_MANTLE_TESTNET =
    "Follow step 5 for this";
const WALLET_OWNER = "****your_wallet_account_address*****";
const WALLET_PRIVATE_KEY =
    "*****your_wallet_private_key******";
const POLYGONSCAN_KEY = "*****get_api_key_from_polygon_scan";
const ALCHEMY_KEY_TEST =
    "***get_api_key_from_alchmey_for_polygon_testnet***";
const ALCHEMY_KEY_PROD =
    "***get_api_key_from_alchmey_for_polygon_mainnet***";
```

3. Navigate to project's backend directory:

```bash
cd smart_contract
```

4. Clone and run the backend to get CONTRACT_ADDRESS for keys.dart file:
```bash
npx hardhat run scripts/deploy.js --network Main
```

5. Run the following to get CONTRACT_ADDRESS_MANTLE_TESTNET for keys.dart file:

```bash
npx hardhat run scripts/deploy.js --network mantle-testnet
```

6. Navigate to project's root directory:

```bash
cd -
```

7. Check for Flutter setup and connected devices:

```bash
flutter doctor
```

8. Run the app:

```bash
flutter run
```

## Contributing

Contribution to the project can be made if you have some improvements for the project or if you find some bugs.
You can contribute to the project by reporting issues, forking it, modifying the code and making a pull request to the repository.

Please make sure you specify the commit type when opening pull requests:

```
feat: The new feature you're proposing

fix: A bug fix in the project

style: Feature and updates related to UI improvements and styling

test: Everything related to testing

docs: Everything related to documentation

refactor: Regular code refactoring and maintenance
```

## License

The project is released under the [MIT License](http://www.opensource.org/licenses/mit-license.php). The license can be found [here](LICENSE).

## Flutter

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


If you like it, make sure to star our repo :)
