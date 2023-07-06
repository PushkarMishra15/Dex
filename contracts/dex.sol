// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

 contract dex{
      
     mapping(address => mapping(address => address)) public pair;
     
     mapping(address => mapping( address=>uint256)) public amount_Dai;
     mapping(address => mapping( address=>uint256)) public amount_Tether;

     uint256 public DaiToken_Supply = 50; 
     uint256 public Tether_Supply = 50;

     address public Dai;
     address public Tether;

     uint256 public liquidity;
     uint256 public x;
     uint256 public return_amount;
         
    function deposit(address _Dai, uint256 amountA, address _Tether, uint256 amountB) public {
        require(amountA > 0, "Amount must be greater than zero");
        require(_Dai != address(0), "Invalid token address");
        Dai = _Dai;
        Tether = _Tether; 
        
        pair[_Dai][_Tether] = msg.sender;
        amount_Dai[_Dai][msg.sender] = amountA;
        amount_Tether[_Tether][msg.sender] = amountB;
        liquidity = amountA*amountB;

    }

    function withdraw(address token, uint256 amount) public {
        
        require(amount > 0, "Amount must be greater than zero");
        require(token != address(0), "Invalid token address");
        amount_Dai[token][msg.sender] -= amount;
        amount_Tether[token][msg.sender] -= amount;
          
    } 
    function trade(address _token, uint256 _amount) public payable{
        require(_amount > 0, "Amounts must be greater than zero");
        require(_token != address(0) , "Invalid token address");

        if(_token == Dai) {

        x = liquidity / (_amount + amount_Dai[_token][msg.sender] );
        return_amount = (amount_Tether[Tether][msg.sender] - x );
        DaiToken_Supply -= _amount;
        Tether_Supply += return_amount;

        }else{
         
        x = liquidity / (_amount + amount_Tether[_token][msg.sender] );
        return_amount = (amount_Dai[Dai][msg.sender] - x );
        Tether_Supply -= _amount;
        DaiToken_Supply += return_amount;   

        }      
    }
 }

// Contract Address is   0x1B74b018Dc2C20A28f46e16cc56c88F8ccE99B2c