# ERC-20 Token Project

This project contains an ERC-20 token smart contract implemented in Solidity, along with deployment and testing scripts using Foundry.

## Prerequisites

- [Foundry](https://github.com/foundry-rs/foundry) - A blazing fast, portable and modular toolkit for Ethereum application development written in Rust.
- [Anvil](https://github.com/foundry-rs/anvil) - Local Ethereum node simulator for development and testing.

## Project Structure

- `src/MyToken.sol` - The ERC-20 token smart contract.
- `script/DeployMyToken.s.sol` - Deployment script for the token contract.
- `test/` - Directory containing test files.
- `makefile` - Makefile with useful commands for building, testing, deploying, and running Anvil.

## Usage

### Start Local Ethereum Node

Start the local Ethereum node simulator (Anvil) with:

```bash
make anvil
```

This will start Anvil with a predefined mnemonic and block time settings.

### Deploy the Token Contract

In a new terminal (while Anvil is running), deploy the token contract with:

```bash
make deploy
```

This uses Foundry's `forge` to deploy the contract to the local Anvil node.

### Run Tests

Run the test suite with:

```bash
make test
```

### Other Useful Commands

- `make clean` - Clean the build artifacts.
- `make build` - Build the project.
- `make format` - Format the code using Foundry's formatter.

## Notes

- Ensure Anvil is running before deploying or running tests that require a blockchain.
- The default private key used for deployment is set in the makefile as `DEFAULT_ANVIL_KEY`.

## License

This project is licensed under the MIT License.
