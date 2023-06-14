# Contracts

## Installation

```shell
yarn install
```

## Compilation

```shell
npx hardhat compile
```
## Test

```shell
npx hardhat test
```

## Deployment
- Deployment scripts are stored in [`deploy`](../contracts/scripts/deploy.ts) 
file.
- Deployment contract addresses will be stored in [`config`](../contracts/config.json) file.
### Baobab
```
npx hardhat run scripts/deploy.ts --network baobab
```
