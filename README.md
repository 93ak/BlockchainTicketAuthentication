# ChainPass

ChainPass is a simple blockchain-based ticket authentication system designed to prevent ticket fraud.  


---

# Tech Stack

**Frontend**
- HTML
- JavaScript

**Blockchain**
- Solidity (Smart Contracts)

**Blockchain Tools**
- Remix IDE (for compiling and deploying smart contracts)
- Ganache (local Ethereum blockchain)

**Wallet Integration**
- MetaMask

**QR Code Tools**
- qrcode.js (QR generation)
- html5-qrcode (QR scanning)

**Deployment**
- Netlify (for hosting the mobile phone scanner)

---

# How to Run the Project

## 1. Start Local Blockchain
Run Ganache to create a local Ethereum blockchain.

## 2. Compile and Deploy Smart Contract
1. Open Remix IDE  
2. Paste the Solidity contract
3. Compile the contract using the **Paris EVM version**
4. Connect Remix to **MetaMask**
5. Deploy the contract to the Ganache network

After deployment, copy the **contract address and ABI** into the frontend code.

---

## 3. Run the Frontend

Run the main application using a local server.

Example using VS Code Live Server:


Right click index.html → Open with Live Server
or
npx http-server


---

## 4. Phone Scanner

The mobile scanner is deployed separately using **Netlify**.  
This scanner reads ticket QR codes and sends a verification signal using the **ntfy API** to communicate with the main application.

---

# Features

### Event Organizer
- Create and mint event tickets
- Scan attendee QR codes at the gate
- Automatically burn tickets after entry
- Prevent duplicate ticket usage

### Ticket Buyer
- Purchase a ticket
- Ticket information is recorded on the blockchain
- A unique QR code containing the ticket ID is generated
- QR code is scanned for verification at entry

---

# Future Improvements

- Add a backend to manage:
  - events
  - ticket buyers
  - ticket sellers
  - ticket ownership
- Create separate websites for:
  - event organizers
  - ticket buyers
- Improve blockchain integration and transaction tracking
- Add persistent database storage
