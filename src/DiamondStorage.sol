// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library SharedLib {
    // struct that with state variable
    struct DiamondStorage {
        uint256 sharedVar;
    }
    // returns a storage variable with our state variable
    function diamondStorage() internal pure returns(DiamondStorage storage ds) {
        // gets a "random" storage position by hashing a string
        bytes32 storagePosition = keccak256(abi.encode("Diamond.Storage.SharedLin"));
        // assigns our struct storage slot to storage position
        assembly {
            ds.slot := storagePosition
        }
    }
}
// not the actual Diamond Standard
contract PseudoDiamond {
    // delegate calls Facet1 to update sharedVar
    function writeToSharedVar(address _facet1, uint256 _value) external {
        // write via delegate call
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
    function writeShared(uint256 _value) external {
        // initializes the storage struct by calling library function
        SharedLib.DiamondStorage storage ds = SharedLib.diamondStorage();
        // writes to shared variable
        ds.sharedVar = _value;
    }
}
contract Facet2 {

    function readShared() external view returns (uint256) {
        // initializes the storage struct by calling library function
        SharedLib.DiamondStorage storage ds = SharedLib.diamondStorage();
        // returns shared variable
        return ds.sharedVar;
    }

}