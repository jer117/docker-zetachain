# docker-zetachain
Docker image to run zeta node binary.

This is the repo.
- https://github.com/zeta-chain/node

# ZetaChain
ZetaChain is an EVM-compatible L1 blockchain that enables omnichain, generic smart contracts and messaging between any blockchain.

# Prerequisites
Go 1.20
Docker and Docker Compose (optional, for running tests locally)
buf (optional, for processing protocol buffer files)
jq (optional, for running scripts)
Components of ZetaChain
ZetaChain is built with Cosmos SDK, a modular framework for building blockchain and Ethermint, a module that implements EVM-compatibility.

zeta-node (this repository) contains the source code for the ZetaChain node (zetacored) and the ZetaChain client (zetaclientd).
protocol-contracts contains the source code for the Solidity smart contracts that implement the core functionality of ZetaChain.
Building the zetacored/zetaclientd binaries
For the Athens 3 testnet, clone this repository, checkout the latest release tag, and type the following command to build the binaries:

make install-testnet
to build.

This command will install the zetacored and zetaclientd binaries in your $GOPATH/bin directory.

Verify that the version of the binaries match the release tag.

```bash
zetacored version
zetaclientd version
```
