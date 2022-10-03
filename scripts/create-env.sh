#!/bin/bash

case $1 in
  Ethereum-Mainnet )
    chain=1
    contractAddress=0x514910771AF9Ca656af840dff83E8264EcF986CA
    ;;
  Ethereum-Goerli-Testnet )
    chain=5
    contractAddress=0x326C977E6efc84E512bB9C30f76E30c160eD06FB
    ;;
  BSC-Mainnet )
    chain=56
    contractAddress=0x404460C6A5EdE2D891e8297795264fDe62ADBB75
    ;;
  BSC-Testnet )
    chain=97
    contractAddress=0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06
    ;;
  Matic-Mainnet )
    chain=137
    contractAddress=0xb0897686c545045aFc77CF20eC7A532E3120E0F1
    ;;
  Matic-Mumbai-Testnet )
    chain=80001
    contractAddress=0x326C977E6efc84E512bB9C30f76E30c160eD06FB
    ;;
  RSK-Mainnet )
    chain=30
    contractAddress=0x14ADAE34beF7Ca957ce2DDe5AdD97EA050123827
    ;;
  Gnosis-Chain-Mainnet )
    chain=100
    contractAddress=0xE2e73A1c69ecF83F464EFCE6A5be353a37cA09b2
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
    chain=421613
    contractAddress=0xd14838a68e8afbade5efb411d5871ea0011afd28
    ;;
  Heco-Mainnet )
    chain=128
    contractAddress=0x9e004545c59D359F6B7BFB06a26390b087717b42
    ;;
  Optimism-Mainnet )
    chain=10
    contractAddress=0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6
    ;;
  Optimism-Goerli-Testnet )
    chain=420
    contractAddress=0xdc2CC710e42857672E7907CF474a69B63B93089f
    ;;
  Harmony-Mainnet )
    chain=1666600000
    contractAddress=0x218532a12a389a4a92fC0C5Fb22901D1c19198aA
    ;;
  Moonriver-Mainnet )
    chain=1285
    contractAddress=0x8b12Ac23BFe11cAb03a634C1F117D64a7f2cFD3e
    ;;
  Moonbeam-Mainnet )
    chain=1284
    contractAddress=0x012414A392F9FA442a3109f1320c439C45518aC3
    ;;
  Metis-Mainnet )
    chain=1088
    contractAddress=0x79892E8A3Aea66C8F6893fa49eC6208ef07EC046
    ;;
  Klaytn-Baobab-Testnet )
    chain=1001
    contractAddress=0x04c5046A1f4E3fFf094c26dFCAA75eF293932f18
    ;;
esac

printf "# Chainlink Environment file
### Node Config/Info ###
ROOT=/chainlink
ALLOW_ORIGINS=*

### Logging ###
JSON_CONSOLE=true
LOG_LEVEL=debug

### EVM Chain Info ###
ETH_CHAIN_ID=${chain}
LINK_CONTRACT_ADDRESS=${contractAddress}
ETH_URL=$2
# ETH_HTTP_URL=
# ETH_SECONDARY_URLS=
# EVM_NODES=

### Database ###
DATABASE_URL=postgresql://$3:$4@$5:$6/$7
DATABASE_TIMEOUT=0
DATABASE_LOCKING_MODE=lease
# SKIP_DATABASE_PASSWORD_COMPLEXITY_CHECK=true

## Web Server (enabled by default) ##
CHAINLINK_TLS_PORT=0
SECURE_COOKIES=false

## Web Server TLS (disabled by default) ##
# CHAINLINK_TLS_PORT=6689
# SECURE_COOKIES=true
# TLS_CERT_PATH=/chainlink/tls/server.crt
# TLS_KEY_PATH=/chainlink/tls/server.key

### Transaction Manager ###
MIN_OUTGOING_CONFIRMATIONS=3
# MIN_INCOMING_CONFIRMATIONS=2

### Gas Bumper ###
# GAS_UPDATER_ENABLED=true
# GAS_UPDATER_TRANSACTION_PERCENTILE=71
# ETH_GAS_PRICE_DEFAULT=1000000000
# ETH_GAS_BUMP_THRESHOLD=5
# ETH_GAS_BUMP_WEI=20000000000
# ETH_GAS_BUMP_PERCENT=50
# ETH_MAX_GAS_PRICE_WEI=2500000000000

### OCR (disabled by default) ###
# OCR_TRACE_LOGGING=true
# FEATURE_OFFCHAIN_REPORTING=true
# OCR_KEY_BUNDLE_ID=
# OCR_TRANSMITTER_ADDRESS=
# P2P_NETWORKING_STACK=

### OCR Networking Stack V1 ###
# P2P_ANNOUNCE_IP=
# P2P_ANNOUNCE_PORT=
# P2P_BOOTSTRAP_PEERS=
# P2P_LISTEN_IP=
# P2P_LISTEN_PORT=
# P2P_PEER_ID=

### OCR Networking Stack V2 ###
# P2PV2_ANNOUNCE_ADDRESSES=
# P2PV2_BOOTSTRAPPERS=
# P2PV2_LISTEN_ADDRESSES=
" > /home/ec2-user/.chainlink/.env

echo
echo -e "Created environment variables file"
echo
