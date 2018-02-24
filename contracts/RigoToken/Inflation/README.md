# Inflation Contract
an inflation contract for the Rigo token.

## Inflation version 0.4.1
```
Mainnet:
Ropsten:
Kovan:
```
Bytecode
```
0x6060604052626ebe00600155341561001657600080fd5b60405160608061087e83398101604052808051919060200180519190602001805160008054600160a060020a0319908116600160a060020a0397881617825560058054821633891617905560038054821696881696909617909555600480549095169190951617909255506107ec9182915061009290396000f3006060604052600436106100b65763ffffffff60e060020a600035041663020e0cdb81146100bb5780630f3a9f65146100df57806319262d30146100f55780633edd80c31461012857806374bab550146101575780637802815c1461016d5780637a9e5e4b1461018c578063a6c9c443146101ab578063be5ddb99146101be578063bf7e214f146101e0578063d410e0c2146101f3578063d9ed29aa14610224578063e70eadc014610243578063ef78d4fd14610256575b600080fd5b34156100c657600080fd5b6100dd600160a060020a0360043516602435610269565b005b34156100ea57600080fd5b6100dd600435610324565b341561010057600080fd5b610114600160a060020a0360043516610344565b604051901515815260200160405180910390f35b341561013357600080fd5b61013b610377565b604051600160a060020a03909116815260200160405180910390f35b341561016257600080fd5b6100dd600435610386565b341561017857600080fd5b6100dd600160a060020a03600435166103a6565b341561019757600080fd5b6100dd600160a060020a03600435166103f0565b34156101b657600080fd5b61013b61043a565b34156101c957600080fd5b610114600160a060020a0360043516602435610449565b34156101eb57600080fd5b61013b610725565b34156101fe57600080fd5b610212600160a060020a0360043516610734565b60405190815260200160405180910390f35b341561022f57600080fd5b6100dd600160a060020a036004351661074f565b341561024e57600080fd5b61013b610799565b341561026157600080fd5b6102126107a8565b60055433600160a060020a0390811691161461028457600080fd5b6004548290600160a060020a03168063dcb7a3e08360006040516020015260405160e060020a63ffffffff8416028152600160a060020a039091166004820152602401602060405180830381600087803b15156102e057600080fd5b6102c65a03f115156102f157600080fd5b50505060405180519050151561030657600080fd5b5050600160a060020a03909116600090815260076020526040902055565b60055433600160a060020a0390811691161461033f57600080fd5b600155565b600160a060020a03811660009081526006602052604081206003015442101561036e576000610371565b60015b92915050565b600554600160a060020a031681565b60055433600160a060020a039081169116146103a157600080fd5b600255565b60055433600160a060020a039081169116146103c157600080fd5b6005805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b60055433600160a060020a0390811691161461040b57600080fd5b6004805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b600054600160a060020a031681565b6003546000908190819081908190819033600160a060020a0390811691161461047157600080fd5b600080546002548a92600160a060020a039283169284929184916370a08231919085169063893d20e890604051602001526040518163ffffffff1660e060020a028152600401602060405180830381600087803b15156104d057600080fd5b6102c65a03f115156104e157600080fd5b5050506040518051905060006040516020015260405160e060020a63ffffffff8416028152600160a060020a039091166004820152602401602060405180830381600087803b151561053257600080fd5b6102c65a03f1151561054357600080fd5b505050604051805190501015151561055a57600080fd5b600160a060020a038b166000908152600660205260409020600301548b9042101561058457600080fd5b600160a060020a038c16600090815260066020526040902042600282018190556001805490910160038301556004909101805490910190556064605f8c020498506105cf8b8a6107ae565b97508b965086600160a060020a031663893d20e86000604051602001526040518163ffffffff1660e060020a028152600401602060405180830381600087803b151561061a57600080fd5b6102c65a03f1151561062b57600080fd5b5050506040518051600054909750600160a060020a031695508590506379c65068878b60405160e060020a63ffffffff8516028152600160a060020a0390921660048301526024820152604401600060405180830381600087803b151561069157600080fd5b6102c65a03f115156106a257600080fd5b5050600554600160a060020a0380881692506379c6506891168a60405160e060020a63ffffffff8516028152600160a060020a0390921660048301526024820152604401600060405180830381600087803b15156106ff57600080fd5b6102c65a03f1151561071057600080fd5b5060019e9d5050505050505050505050505050565b600454600160a060020a031681565b600160a060020a031660009081526007602052604090205490565b60055433600160a060020a0390811691161461076a57600080fd5b6003805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b600354600160a060020a031681565b60015481565b6000828211156107ba57fe5b509003905600a165627a7a72305820bfa0538c3cf62e6fb243c8b03ccebb810545554a1822fdd227e1a1a0627423fa0029
```
ABI
```
[
	{
		"constant": true,
		"inputs": [],
		"name": "RIGOTOKENADDRESS",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_thePool",
				"type": "address"
			}
		],
		"name": "canWithdraw",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_group",
				"type": "address"
			}
		],
		"name": "getInflationFactor",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "period",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "proofOfPerformance",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "rigoblockDao",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "authority",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_authority",
				"type": "address"
			}
		],
		"name": "setAuthority",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_newRigoblock",
				"type": "address"
			}
		],
		"name": "setRigoblock",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_pop",
				"type": "address"
			}
		],
		"name": "setProofOfPerformance",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_thePool",
				"type": "address"
			},
			{
				"name": "_reward",
				"type": "uint256"
			}
		],
		"name": "mintInflation",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_newPeriod",
				"type": "uint256"
			}
		],
		"name": "setPeriod",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_minimum",
				"type": "uint256"
			}
		],
		"name": "setMinimumRigo",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_group",
				"type": "address"
			},
			{
				"name": "_inflationFactor",
				"type": "uint256"
			}
		],
		"name": "setInflationFactor",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"name": "_rigoTokenAddress",
				"type": "address"
			},
			{
				"name": "_proofOfPerformance",
				"type": "address"
			},
			{
				"name": "_authority",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]
```