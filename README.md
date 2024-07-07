
#  MyERC20Token Management

The MyERC20Token contract is a Solidity smart contract that implements the ERC20 token standard on the Ethereum blockchain. It allows for the creation and management of a custom ERC20 token named "MyERC20Token" with the symbol "MET". This contract leverages OpenZeppelin's ERC20 and Ownable contracts for standard compliance and secure ownership management.


## Description
Certainly! Here's a concise paragraph describing the `MyERC20Token` contract:

The `MyERC20Token` contract is a Solidity smart contract that implements the ERC20 token standard on the Ethereum blockchain. Upon deployment, it initializes a custom token named "MyERC20Token" with the symbol "MET". This contract leverages OpenZeppelin's `ERC20` and `Ownable` contracts for standard compliance and ownership management. The owner of the contract has exclusive rights to mint new tokens to designated addresses using the `mint` function, while any user can burn their tokens with the `burn` function or transfer tokens to other addresses via the overridden `transfer` function. These functions ensure secure and efficient management of token operations, adhering to best practices in token creation and management on Ethereum.

## Getting started
## Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at-https://remix.ethereum.org/
## Deployment
To deploy this contract on the Ethereum blockchain:

Use Remix, Hardhat, or similar Ethereum development tools.
Ensure proper gas settings and network selection.
Deploy the contract with the specified name and symbol.


## MyERC20Token code
// SPDX-License-Identifier: MIT    

pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC20Token is ERC20, Ownable {

    constructor() ERC20("MyERC20Token", "MET")Ownable(msg.sender) {
        transferOwnership(msg.sender);
    }
    function mint(address toADDRESS, uint256 amount) external onlyOwner {
        _mint(toADDRESS, amount);
    }
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        require(success, "Token transfer failed");
        return success;
    }
}

## Features
Token Name: MyERC20Token
Token Symbol: MET
Ownership: Implements ownership functionality using the Ownable contract.
Token Minting: The contract owner can mint new tokens to designated addresses.
Token Burning: Users can burn (destroy) their own tokens, reducing the total token supply.
Token Transfer: Includes an overridden transfer function with custom error handling for secure token transfers.

## Interacting with the Contract
Once deployed, interact with the contract functions:

Mint Tokens: Use the mint function to create and assign new tokens to a specified address.
Burn Tokens: Any user can burn their tokens using the burn function.
Transfer Tokens: Transfer tokens between addresses using the overridden transfer function.
## Author
prakhar kumar
@prakhar1980

## License
This project is licensed under the MIT License. See the LICENSE file for details.

