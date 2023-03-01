const fcl = require("@onflow/fcl");


async function main() {

    // fcl.config({
    //     "discovery.wallet": "https://fcl-discovery.onflow.org/testnet/authn", // Endpoint set to Testnet
    // })

    // fcl.authenticate()

    const transactionId = await fcl.mutate({
        cadence: `
        transaction {
          execute {
            log("Hello from execute")
          }
        }
      `,
        proposer: fcl.currentUser,
        payer: fcl.currentUser,
        limit: 50
    })

    const transaction = await fcl.tx(transactionId).onceSealed()
    console.log(transaction) // The transactions status and events after being sealed
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });