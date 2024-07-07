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
