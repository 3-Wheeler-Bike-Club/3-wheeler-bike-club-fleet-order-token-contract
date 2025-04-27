# 3WB Fleet Order Token Contract

An ERC20 token contract for 3WB fleet order investments, enabling capped minting of tokens as digital receipts for off-chain pre-payments via PSPs.

## 🚀 Features

- **ERC20 Standard**: Implements OpenZeppelin's ERC20 with name `"FleetOrderToken"` and symbol `"3WBFOT"`.
- **Capped Supply**: `MAX_SUPPLY` constant limits total supply to **999,000,000,000** tokens (18 decimals).
- **Controlled Minting**: `dripPayeeFromPSP(address to, uint256 amount)` allows the **owner** to mint tokens up to the cap.
- **Pausable**: Inherits `Pausable`—owner can pause/unpause minting operations.
- **Ownership**: Inherits `Ownable`—only the deployer (owner) can invoke administrative actions.

## 📋 Public API

| Function                                                               | Description                                                |
| ---------------------------------------------------------------------- | ---------------------------------------------------------- |
| `decimals() external pure override returns (uint8)`                   | Returns token decimals (18).                               |
| `pause() external onlyOwner`                                          | Pauses `dripPayeeFromPSP` (and other pausable functions).  |
| `unpause() external onlyOwner`                                        | Unpauses contract.                                         |
| `dripPayeeFromPSP(address to, uint256 amount) public onlyOwner whenNotPaused` | Mints `amount` tokens to `to`, ensuring total ≤ `MAX_SUPPLY`. |
| *Standard ERC20 methods*                                              | Includes `transfer`, `transferFrom`, `approve`, etc.       |

## 🛠️ Setup & Development

### Prerequisites

- [Foundry](https://book.getfoundry.sh/) (`forge`, `anvil`, `cast`).
- Node.js (for deployment scripts).
- RPC endpoint & private key configured for Celo/Ethereum.

### Install & Compile

```bash
git clone https://github.com/3-Wheeler-Bike-Club/3-wheeler-bike-club-fleet-order-token-contract.git
cd 3-wheeler-bike-club-fleet-order-token-contract

# Ensure Foundry is current
foundryup

# Compile contracts
forge build
```

### Testing

```bash
forge test
```

### Deployment

1. Create a `.env` file in the project root:
   ```env
   PRIVATE_KEY=0x<your_private_key>
   RPC_URL=https://forno.celo.org
   ```
2. Run the deployment script (example):
   ```bash
   forge script scripts/DeployFleetOrderToken.s.sol \
     --rpc-url $RPC_URL \
     --private-key $PRIVATE_KEY \
     --broadcast
   ```
3. Note the deployed contract address from the console output.

## 📁 Directory Structure

```
/
├── src/                  # Solidity source files
│   └── FleetOrderToken.sol
├── lib/                  # Submodule dependencies (ERC20, Ownable, Pausable)
├── scripts/              # Deployment scripts
├── foundry.toml          # Foundry configuration
├── remappings.txt        # Solidity remappings
└── README.md             # This file
```

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/...`).
3. Add tests for new behavior.
4. Open a Pull Request with clear descriptions.

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE).  
```

