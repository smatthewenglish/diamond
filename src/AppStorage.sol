// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// struct with state variable
struct StateVars {
    uint256 sharedVar;
}
// our app storage struct
struct AppStorage {
    StateVars state;
}
// not the actual Diamond Standard 
contract PseudoDiamond {
    AppStorage s;
    // delegate calls Facet1 to update sharedVar
    function writeToSharedVar(address _facet1, uint256 _value) external {
        // writes via delegate call
        _facet1.delegatecall(
            abi.encodeWithSignature("writeShared(uint256)", _value)
        );
    }
    // delegate calls Facet2 to read sharedVar
    function readSharedVar(address _facet2) external returns (uint256) {
        // returns result of delegate call
        (bool success, bytes memory _valueBytes) = _facet2.delegatecall(
            abi.encodeWithSignature("readShared()")
        );
        // since return value is bytes array we use assembly to retrieve our uint
        bytes32 _value;
        assembly {
            let location := _valueBytes
            _value := mload( add(location, 0x20) )
        }
        return uint256(_value);
    }
}
contract Facet1 {
    AppStorage s;
    function writeShared(uint256 _value) external {
        // write to our state variable in storage
        s.state.sharedVar = _value;
    }
}
contract Facet2 {
    AppStorage s;

    function readShared() external view returns (uint256) {
        // returns state variable from app storage
        return s.state.sharedVar;
    }
}