
// SPDX-License-Identifier: MIT
//pragma solidity 0.8.18;
pragma solidity ^0.8.0;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
    /*struct Token{
        string token_name = "STUDENT";
        string token_abbrv = "S";
        uint256 total_supply = 0;
    }
    Token[] public Token;
    function create_Token(string memory name, string memory abbrv, uint256 supply) public {
        Token memory New_Token = Token(name, abbrv, supply);
        tokens.push(New_Token);
    }
    create_Token("Akash", "A", 2000);
    create_Token("Jass", "J", 4500);
    create_Token("Desh", "D", 3000); */

    string public token_name;
    string public token_abbrv;
    uint256 public total_supply;


    // mapping variable here
    mapping(address => uint256) public balances;


    // mint function
    function mint_token (address recipient, uint256 amount) public {
        total_supply += amount;
        balances[recipient] += amount;
    }

    // burn function
    function burn_token (address recipient, uint256 amount) public {
        uint256 senderBalance = balances[recipient];
        if (senderBalance >= amount) {
            total_supply -= amount;
            balances[recipient] -= amount;
        }
    }   

}
