## quickstart-chainlink-chainlink-node—Quick Start

For architectural details, step-by-step instructions, and customization options, see the [deployment guide](https://aws-quickstart.github.io/quickstart-chainlink-chainlink-node/).

To post feedback, submit feature ideas, or report bugs, use the **Issues** section of this GitHub repo.

To submit code for this Quick Start, see the [AWS Quick Start Contributor's Kit](https://aws-quickstart.github.io/).

## Start a Chainlink Node

Deploying this Quick Start will create highly available Chainlink nodes using with default parameters and a provided blockchain.

## This Quick Start sets up the following:

- A virtual private cloud (VPC) configured across two Availability Zones with public and private subnets according to AWS best practices.\*
- An internet gateway to allow access to the internet.\*
- Managed NAT gateways to allow outbound internet access for the Chainlink node instances.\*
- An Amazon EC2 Auto Scaling group with a configurable number of Bastion instance(s) on the public subnet.
- An Amazon EC2 Auto Scaling group with two Chainlink node instances on the private subnet
- Security groups for each instance.
- Elastic Load Balancing (ELB) load balancers to access the Chainlink node web graphical user interface.
- An Amazon Relation Database Service (Amazon RDS) PostgreSQL managed database instance.
- Amazon CloudWatch logging of Chainlink Node

_\*The template that deploys the Quick Start into an existing VPC skips the tasks marked by asterisks and prompts you for your existing VPC configuration_

## Deployment Options

This Quick Start provides two deployment options:

- Deploy Chainlink Node into a new VPC (end-to-end deployment).
- Deploy Chainlink Node into an existing VPC

The Quick Start provides separate templates for these options. It also lets you configure
CIDR blocks, instance types, database instance types, and environment variables, as discussed later in this guide.

## Prerequisite

1. Create a key pair in your preferred region.
2. Create a public certificate using Amazon Certificate Manager in your preferred region.
3. If using an existing VPC, make sure that it contains two public subnets, two private subnets, internet gateway, NAT gateways, and route tables.

## Manually creating env, api, and password files

1. Run create-env.sh to create the environment variable file for your Chainlink node

### Blockchain Networks:

- ETH-Mainnet
- Kovan-ETH-Testnet
- Rinkeby-ETH-Testnet
- xDai-Mainnet
- Heco-Mainnet
- BSC-Mainnet
- Matic-Mainnet

```
./.chainlink/create-env.sh \
<blockchain network> \
<ethereum websocket endpoint> \
<postgresql username> \
<postgresql password> \
<postgresql hostname> \
<postgresql port number> \
<postgresql database name>
```

2. Run create-password.sh to create your Chainlink node keystore password file

```
./.chainlink/create-password.sh \
<your keystore password>
```

Password Requirements:

- 3 lowercase characters
- 3 uppercase characters
- 3 numbers
- 3 special characters
