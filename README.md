# NFT Creation and Deployment Project

This project demonstrates the creation and deployment of a Non-Fungible Token (NFT) using Solidity and the Brownie Python framework. The NFT is deployed on the Ethereum network, showcasing how digital assets can be uniquely owned and traded on the blockchain.

## Overview

This NFT project is a simple demonstration aimed at developers and enthusiasts interested in the workings of NFTs and blockchain technology. The project uses Solidity for smart contract development and Brownie as a development and testing framework to facilitate the deployment process.

## Features

- **NFT Creation**: The project includes a Solidity smart contract for creating NFTs.
- **Deployment Script**: Utilizes Brownie for deploying the NFT smart contract to the Ethereum network.
- **Test Cases**: Includes basic test cases for the smart contract to ensure its functionality.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/)
- [Python 3.6+](https://www.python.org/downloads/)
- [Ganache](https://trufflesuite.com/ganache/) (for a personal Ethereum blockchain)
- [Metamask](https://metamask.io/) (for interacting with the Ethereum network)

## Setup and Installation

1. **Clone the Repository**
    ```sh
    git clone https://github.com/yourgithubusername/yourprojectname.git
    ```
2. **Install Dependencies**
    - Install Brownie:
        ```sh
        pip install eth-brownie
        ```
    - Install Node.js dependencies (if any):
        ```sh
        npm install
        ```

3. **Environment Variables**
    - Copy the `.env.example` file to `.env` and fill in the variables as needed.

4. **Running Ganache (Optional)**
    - If testing locally, start Ganache to run a personal Ethereum blockchain.

## Deploying the NFT

To deploy the NFT smart contract to the Ethereum network, run:

```sh
brownie run scripts/deploy_and_create.py
