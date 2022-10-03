# Voting Token
Performing elections using ERC-20 Tokens 

This Smart Contract enables voters to vote among 5 candidates. In order to do so, they need to get a token from the Election Office (Contract Owner) and are then allowed to vote. Each voter gets to vote once during the election. Once everyone is done voting, the Election Office shall declare the results.

> For the purpose of this program, it is assumed that there are 14 voters and therefore only 14 tokens are being minted.

# Program Version
> node.js: v16.17.0

> npm: v8.15.0

> Hardhat: v2.11.2

# Commands
```
npm install @openzeppelin/contracts
npm install hardhat
npm install --save-dev @nomicfoundation/hardhat-toolbox
npx hardhat
npx hardhat node
npx hardhat compile
npx hardhat run --network localhost scripts/deploy.js
```
