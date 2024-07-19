// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/access/Ownable.sol";

/**
 * @title TeslaToken
 * @dev BEP-20 Token with an Owner and logo hash functionality
 */
contract TeslaToken is ERC20, Ownable {
    string public logoHash;

    /**
     * @dev Set contract deployer as owner and initialize token
     */
    constructor() ERC20("Turan", "TRN") {
        _mint(msg.sender, 1000000000000000000000000 * 18 ** decimals());
        logoHash = "QmSVW8eiCr9EDi4XGJeCfM9czv8ztjVEYETMgv6gABvBWc";
    }

    /**
     * @dev Mint new tokens
     * @param to address of recipient
     * @param amount number of tokens to mint
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Set logo hash
     * @param _logoHash new logo hash
     */
    function setLogoHash(string memory _logoHash) public onlyOwner {
        logoHash = _logoHash;
    }

    /**
     * @dev Return the logo hash
     * @return logo hash
     */
    function getLogoHash() external view returns (string memory) {
        return logoHash;
    }
}
