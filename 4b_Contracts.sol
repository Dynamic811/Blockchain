pragma solidity >=0.8.0;

contract C {
    //private state variable
    uint private data;
    
    //public state variable
    uint public info;
    
    //constructor
    constructor() {
        info = 10;
    }
    
    //public function
    function updateData(uint a) public { 
        data = a; 
    }
    
    function getData() public virtual view returns(uint) { 
    return data; 
}
    
    function compute(uint a, uint b) public pure returns (uint) { 
        return a + b; 
    }
}

//Derived Contract
contract E is C {
    uint private result;
    C private c;
    
    constructor() {
        c = new C();
    } 
    
    function getComputedResult() public { 
        result = this.compute(3, 5); 
    }
    
    function getResult() public view returns(uint) { 
        return result; 
    }
    
    function getData() public view override returns(uint) { 
        return c.getData(); 
    }
}
