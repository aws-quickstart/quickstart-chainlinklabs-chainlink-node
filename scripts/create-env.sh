#!/bin/bash

case $1 in
  ETH-Mainnet )
    chain=1
    contractAddress=0x514910771af9ca656af840dff83e8264ecf986ca
    ;;
  Kovan-ETH-Testnet )
    chain=42
    contractAddress=0xa36085F69e2889c224210F603D836748e7dC0088
    ;;
  Rinkeby-ETH-Testnet )
    chain=4
    contractAddress=0x01BE23585060835E02B77ef475b0Cc51aA1e0709
    ;;
  Gnosis-Chain-Mainnet )
    chain=100
    contractAddress=0xE2e73A1c69ecF83F464EFCE6A5be353a37cA09b2
    ;;
  Heco-Mainnet )
    chain=128
    contractAddress=0x9e004545c59D359F6B7BFB06a26390b087717b42
    ;;
  BSC-Mainnet )
    chain=56
    contractAddress=0x404460c6a5ede2d891e8297795264fde62adbb75
    ;;
  BSC-Testnet )
    chain=97
    contractAddress=0x84b9b910527ad5c03a9ca831909e21e236ea7b06
    ;;
  Matic-Mainnet )
    chain=137
    contractAddress=0xb0897686c545045afc77cf20ec7a532e3120e0f1
    ;;
  Matic-Mumbai-Testnet )
    chain=80001
    contractAddress=0x326C977E6efc84E512bB9C30f76E30c160eD06FB
    ;;
  Avalanche-Mainnet )
    chain=43114
    contractAddress=0x5947BB275c521040051D82396192181b413227A3
    ;;
  Avalanche-Fuji-Testnet )
    chain=43113
    contractAddress=0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846
    ;;
  Fantom-Mainnet )
    chain=250
    contractAddress=0x6F43FF82CCA38001B6699a8AC47A2d0E66939407
    ;;
  Fantom-Testnet )
    chain=4002
    contractAddress=0xfaFedb041c0DD4fA2Dc0d87a6B0979Ee6FA7af5F
    ;;
  Arbitrum-Mainnet )
    chain=42161
    contractAddress=0xf97f4df75117a78c1A5a0DBb814Af92458539FB4
    ;;
  Arbitrum-Rinkeby-Testnet )
    chain=421611
    contractAddress=0x615fBe6372676474d9e6933d310469c9b68e9726
    ;;
  Optimism-Mainnet )
    chain=10
    contractAddress=0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6
    ;;
  Optimism-Kovan-Testnet )
    chain=69
    contractAddress=0x4911b761993b9c8c0d14Ba2d86902AF6B0074F5B
    ;;
  Harmony-Mainnet )
    chain=1666600000
    contractAddress=0x218532a12a389a4a92fC0C5Fb22901D1c19198aA
    ;;
  Harmony-Testnet )
    chain=1666700000
    contractAddress=0x8b12Ac23BFe11cAb03a634C1F117D64a7f2cFD3e
    ;;
  Moonriver-Mainnet )
    chain=1285
    contractAddress=0x8b12Ac23BFe11cAb03a634C1F117D64a7f2cFD3e
    ;;
esac

printf "# Chainlink Environment file
ROOT=/chainlink
LOG_LEVEL=debug
ETH_CHAIN_ID=${chain}
LINK_CONTRACT_ADDRESS=${contractAddress}
ALLOW_ORIGINS=*
MINIMUM_CONTRACT_PAYMENT_LINK_JUELS=1000000000000
DEFAULT_HTTP_ALLOW_UNRESTRICTED_NETWORK_ACCESS=true
JSON_CONSOLE=true

# Ethereum Mainnet Variables
MIN_OUTGOING_CONFIRMATIONS=2
MIN_INCOMING_CONFIRMATIONS=2
ETH_URL=$2

# Database Values
DATABASE_URL=postgresql://$3:$4@$5:$6/$7
DATABASE_TIMEOUT=0

# Settings for HTTPS (enable these or the ones below for http)
#CHAINLINK_TLS_PORT=6689
#SECURE_COOKIES=true
#TLS_CERT_PATH=/chainlink/tls/server.crt
#TLS_KEY_PATH=/chainlink/tls/server.key

# Setting for HTTP
CHAINLINK_TLS_PORT=0
SECURE_COOKIES=false

# Transaction Improvements
GAS_ESTIMATOR_MODE=BlockHistory
GAS_UPDATER_TRANSACTION_PERCENTILE=71
BLOCK_HISTORY_ESTIMATOR_BLOCK_HISTORY_SIZE=8
ETH_GAS_BUMP_THRESHOLD=2
ETH_GAS_BUMP_WEI=20000000000
ETH_GAS_BUMP_PERCENT=50
ETH_BALANCE_MONITOR_BLOCK_DELAY=3
ENABLE_BULLETPROOF_TX_MANAGER=true

# OCR Variables (OCR disabled by default)
#OCR_KEY_BUNDLE_ID=
#P2P_PEER_ID=
#OCR_TRANSMITTER_ADDRESS=
#FEATURE_OFFCHAIN_REPORTING=true
#OCR_TRACE_LOGGING=true

# LISTENING_PORT OR ANNOUNCE_PORT AND ANNOUNCE_IP (OCR)
#P2P_LISTEN_PORT=

# Must Specify Both of Below OR LISTENING_PORT (OCR)
#P2P_ANNOUNCE_IP=
#P2P_ANNOUNCE_PORT=

# Bootstrap Nodes (OCR)
#P2P_BOOTSTRAP_PEERS=" > /home/ec2-user/.chainlink/.env

echo
echo -e "Created environment variables file"
echo
