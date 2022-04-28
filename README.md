# Crowdfunding Smart Contract

This smart contract allows us to crowdfund projects using Ether. 

### What is a crowdfunding?

It is a mechanism used to raise capital in small amounts until a specific goal is reached.

The project owners share what the project is about, how much money they want to raise and how they would invest this money.

### How this smart contract works?

This smart contract define how projects are created and how anyone with a wallet within Ethereum can contribute Ether to a project.

The amount people will contribute to a project will be sent to a wallet corresponding to the owners of the project, and the total amount contributed will be kept track of.

### Why do this in Blockchain?

The advantages offered by Blockchain allow us to have a reliable and secure crowdfunding system, since each of the contributions will automatically go to the right person and, in addition, there will always be traceability of how these funds are distributed.

### What do I need to do this project?
- [RemixIDE](https://remix.ethereum.org/): a working environment for development.
- [Metamask](https://metamask.io/): a wallet to interact with the Ethereum blockchain platform.
- [Truffle](https://trufflesuite.com/): a testing environment to deploy your contract.

### How is this repo organized?
- The [contract folder](./contracts) contains the [CrowdFunding.sol](./contracts/Crowdfunding.sol) that will execute the smart contract. 
There are some comments to explain the code.

- The [migration folder](./migrations) contains the script needed to deploy our contract.

- The [test folder](./test) contains all the files that allow us to test if our applications and contracts work as they should.

- [truffle-config.js](./truffle-config.js) is the main Truffle configuration file, it will allow us to modify the Truffle configurations.



### Acknowledgment
Thanks to @anfepar and [Platzi](https://platzi.com/) for their lessons that helped me develop this.

Feel free to leave your suggestions to keep improving this project 🙏🏾
