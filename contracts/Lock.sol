// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

 contract dex{
      
     mapping(address => mapping(address => address)) public pair;

     mapping(address => mapping( address=>uint256)) public amount_tokenA;
     mapping(address => mapping( address=>uint256)) public amount_tokenB;
     
     uint256 public liquidity;
     uint256 public x;
     uint256 public return_amount;
         
    function deposit(address tokenA, uint256 amountA, address tokenB, uint256 amountB) public {
        require(amountA > 0, "Amount must be greater than zero");
        require(tokenA != address(0), "Invalid token address");
        pair[tokenA][tokenB] = msg.sender;
        amount_tokenA[tokenA][msg.sender] = amountA;
        amount_tokenB[tokenB][msg.sender] = amountB;
        liquidity = amountA*amountB;
    }

    function withdraw(address token, uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(token != address(0), "Invalid token address");
        amount_tokenA[token][msg.sender] -= amount;
        amount_tokenB[token][msg.sender] -= amount;

    } 
    function trade(address _tokenA, address _tokenB , uint256 _amountA) public payable{
        require(_amountA > 0, "Amounts must be greater than zero");
        require(_tokenA != address(0) , "Invalid token address");
        
        x = liquidity / (_amountA + amount_tokenA[_tokenA][msg.sender] );
        return_amount = ( amount_tokenB[_tokenB][msg.sender] - x );
        
    }
 }