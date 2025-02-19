pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract AdvancedCollectible is ERC721, VRFConsumerBase {
    bytes32 internal keyHash;
    uint256 public fee;
    uint256 public tokenCounter;

    enum Breed {
        PUG,
        SHIBA_INU,
        ST_BERNARD
    }

    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => string) public requestIdToTokenURI;
    mapping(uint256 => Breed) public tokenIdToBreed;
    mapping(bytes32 => uint256) public requestedIdToTokenId;

    event requestedCollectible(bytes32 indexed requestId);

    constructor(
        address _VRFCoordinator,
        address _LinkedToken,
        bytes32 _KeyHash
    )
        public
        VRFConsumerBase(_VRFCoordinator, _LinkedToken)
        ERC721("Doggies", "DOG")
    {
        keyHash = _KeyHash;
        fee = 0.1 * 10**18;
        tokenCounter = 0;
    }

    function createCollectible(uint256 userProvidedSeed, string memory tokenURI)
        public
        returns (bytes32)
    {
        bytes32 requestId = requestRandomness(keyHash, fee, userProvidedSeed);
        requestIdToSender[requestId] = msg.sender;
        requestIdToTokenURI[requestId] = tokenURI;

        //emit requestedCollectible(requestId);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber)
        internal
        override
    {
        address dogOwner = requestIdToSender[requestId];
        string memory tokenURI = requestIdToTokenURI[requestId];
        uint256 newItemId = tokenCounter;

        _safeMint(dogOwner, newItemId);
        _setTokenURI(newItemId, tokenURI);

        Breed breed = Breed(randomNumber % 3);
        tokenIdToBreed[newItemId] = breed;
        requestedIdToTokenId[requestId] = newItemId;
        tokenCounter = tokenCounter + 1;
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );

        _setTokenURI(tokenId, _tokenURI);
    }
}
