pragma solidity ^0.4.24;
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Pausable.sol";
contract Seller is ERC20Pausable, ERC20Mintable, ERC20Burnable {
    string public constant name = "Seller Chain";
    string public constant symbol = "SEC";
    uint8 public constant decimals = 2;
    // uint256 public  _totalSupply = 0;
    uint256 public totalSupply = 1000000;
    constructor () public {
     }
}