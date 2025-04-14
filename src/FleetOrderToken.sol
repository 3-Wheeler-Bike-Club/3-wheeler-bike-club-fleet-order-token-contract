// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
//import { Ownable } from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import {Pausable} from "@openzeppelin/contracts/utils/Pausable.sol";
//import { Pausable } from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Pausable.sol";


/// @title 3wb.club fleet order token V1.0
/// @notice issues tokens for pre-orders received through offchain PSPs for fractional and full investments in 3-wheelers
/// @author Geeloko


contract FleetOrderToken is ERC20, Ownable, Pausable {
    
    /// @notice Event emitted when tokens are minted
    event DrippedPayeeFromPSP(address indexed to, uint256 amount);
    
    
    constructor() 
        Ownable(_msgSender()) 
        ERC20("FleetOrderToken", "3WBFOT")
    {}


    /// @notice Maximum supply of tokens
    uint256 public constant MAX_SUPPLY = 999_000_000_000 * 10**18; // 9 billion tokens
    
    /// @notice Pause the contract 
    function pause() external onlyOwner {
        _pause();
    }


    /// @notice Unpause the contract
    function unpause() external onlyOwner {
        _unpause();
    }


    /// @notice Returns the number of decimals used to get its user representation
    function decimals() public pure override returns (uint8) {
        return 18;
    }


    /// @notice Mint new tokens per offchain payment amount
    /// @param to The address to mint the tokens to
    /// @param amount The amount of tokens to mint
    function dripPayeeFromPSP(address to, uint256 amount) public onlyOwner whenNotPaused {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
        emit DrippedPayeeFromPSP(to, amount);
    }
}
