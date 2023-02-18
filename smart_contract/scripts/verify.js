const hre = require("hardhat");
require("dotenv").config();

async function main() {
    const CONTRACT_NAME = process.env.CONTRACT_NAME;
    const CONTRACT_SYMBOL = process.env.CONTRACT_SYMBOL;
    const CONTRACT_ADDRESS_MANTLE_TESTNET = process.env.CONTRACT_ADDRESS_MANTLE_TESTNET;

    await hre.run("verify:verify", {
        address: CONTRACT_ADDRESS_MANTLE_TESTNET,
        constructorArguments: [CONTRACT_NAME, CONTRACT_SYMBOL]
    });

    let msg = CONTRACT_NAME + ' (' + CONTRACT_SYMBOL + ') verified at: ';
    console.log(msg, CONTRACT_ADDRESS_MANTLE_TESTNET);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });