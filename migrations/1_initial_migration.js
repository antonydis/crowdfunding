//1_initial_migration.js

//Instance of our contract CrowdFunding.sol
const CrowdFunding = artifacts.require("CrowdFunding"); 

module.exports = function (deployer) {
    //This script deploys our contract to the blockchain
    deployer.deploy(CrowdFunding); 
};
