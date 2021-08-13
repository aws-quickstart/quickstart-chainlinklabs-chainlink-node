## quickstart-chainlink-chainlink-node—Quick Start

For architectural details, step-by-step instructions, and customization options, see the [deployment guide](https://aws-quickstart.github.io/quickstart-chainlink-chainlink-node/).

To post feedback, submit feature ideas, or report bugs, use the **Issues** section of this GitHub repo.

To submit code for this Quick Start, see the [AWS Quick Start Contributor's Kit](https://aws-quickstart.github.io/).

## Start a Chainlink Node

Deploying this Quick Start will create highly available Chainlink nodes using with default parameters and a provided blockchain.

## Prerequisite

1. Create a key pair in your preferred region.
2. If using a domain and SSL certificate to access your Chainlink node web GUI, create a public certificate using Amazon Certificate Manager in your preferred region.
3. If using an existing VPC, make sure that it contains two public subnets, two private subnets, internet gateway, NAT gateways, and route tables.

## Manually creating env, api, and password files

1. Run create-env.sh to create the environment variable file for your Chainlink node

```
cd /home/ec2-user/.chainlink/ && ./create-env.sh \
${chainNetwork} \
${blockchainNodeUrl} \
${psqlUser} \
$(aws secretsmanager get-secret-value --secret-id DBSecret --query "SecretString" --output text) \
${psqlHostname} \
${psqlPort} \
${psqlDb}
```

2. Run create-password.sh to create your Chainlink node keystore password file

```
cd /home/ec2-user/.chainlink/ && ./create-password.sh \
$(aws secretsmanager get-secret-value --secret-id WalletSecret --query "SecretString" --output text)
```

3. Run create-api.sh to create your Chainlink node API file

```
cd /home/ec2-user/.chainlink/ && ./create-api.sh \
${apiUser} \
$(aws secretsmanager get-secret-value --secret-id ApiSecret --query "SecretString" --output text)
```

## Running Chainlink node Docker instance

```
latestimage=$(curl -s -S "https://registry.hub.docker.com/v2/repositories/smartcontract/chainlink/tags/" | jq -r '."results"[]["name"]' | head -n 1)
cd /home/ec2-user/.chainlink && docker run -d \
--log-driver=awslogs \
--log-opt awslogs-group=ChainlinkLogs \
--restart unless-stopped \
--name chainlink \
-p 6688:6688 \
-v /home/ec2-user/.chainlink:/chainlink \
--env-file=/home/ec2-user/.chainlink/.env  smartcontract/chainlink:${latestimage} local n \
-p /chainlink/.password \
-a /chainlink/.api
```
