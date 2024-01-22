// This is used in diamond constructor
// more arguments are added to this struct
// this avoids stack too deep errors
struct DiamondArgs {
    address owner;
    address init;
    bytes initCallData;
}

contract Diamond {
    constructor(IDiamond.FacetCut[] memory _diamondCut, DiamondArgs memory _args) payable {
        LibDiamond.setContractOwner(_args.owner);
        LibDiamond.diamondCut(_diamondCut, _args.init, _args.initCallData);
        // Code can be added here to perform actions and set state variables.
    }
    // rest of code
}
struct FacetCut {
    address facetAddress;
    FacetCutAction action;
    bytes4[] functionSelectors;
}