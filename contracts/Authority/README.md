# Authority Contract
a contract for managing permissions.

Name in parity registry: authority-v2

## Authority version 0.4.1
```
Mainnet: 0x56cadce6c2f02857faf06912a531bda33c3494e9
Ropsten: 0x56cadce6c2f02857faf06912a531bda33c3494e9
Kovan: 0x56cadce6c2f02857faf06912a531bda33c3494e9
```
Bytecode
```
606060405260008054600160a060020a033316600160a060020a03199091161790556115ba806100306000396000f30060606040526004361061018a5763ffffffff7c0100000000000000000000000000000000000000000000000000000000600035041663088f47ee811461018f57806313af4035146101be5780631610ac4d146101df5780631a68f034146101fe5780632314d79c146102255780632330f2471461023857806326c7a0de1461025757806336f8dc891461026a5780633f7532e21461027d578063449389001461029c578063485ff697146102bb5780636e571167146102da578063770f434f146102fe5780637b9d4d261461031d5780638da5cb5b146103415780639aa4d0a0146103545780639e2de32d14610373578063a0ca3ee114610392578063a2ce2773146103b6578063a3254102146103d5578063ab1dc427146103f9578063ad562f4014610418578063b191f13b1461043c578063b5f0d35c1461045b578063c4ef5c851461047f578063c91b0149146104a4578063cba91dd2146104c8578063d88c271e146104ec578063dcb7a3e014610373578063e22940651461050b578063e6e66c681461057c575b600080fd5b341561019a57600080fd5b6101a26105a0565b604051600160a060020a03909116815260200160405180910390f35b34156101c957600080fd5b6101dd600160a060020a03600435166105b0565b005b34156101ea57600080fd5b6101dd600160a060020a0360043516610632565b341561020957600080fd5b61021161069e565b604051901515815260200160405180910390f35b341561023057600080fd5b6101a26106c2565b341561024357600080fd5b610211600160a060020a03600435166106d1565b341561026257600080fd5b6101a2610709565b341561027557600080fd5b6101a2610718565b341561028857600080fd5b6101dd600160a060020a0360043516610727565b34156102a757600080fd5b610211600160a060020a03600435166107af565b34156102c657600080fd5b6101a2600160a060020a03600435166107e1565b34156102e557600080fd5b6101dd600160a060020a036004351660243515156107ff565b341561030957600080fd5b6101dd600160a060020a0360043516610930565b341561032857600080fd5b6101dd600160a060020a0360043516602435151561099c565b341561034c57600080fd5b6101a2610ade565b341561035f57600080fd5b610211600160a060020a0360043516610aed565b341561037e57600080fd5b610211600160a060020a0360043516610b1e565b341561039d57600080fd5b6101dd600160a060020a03600435166024351515610b54565b34156103c157600080fd5b610211600160a060020a0360043516610c6b565b34156103e057600080fd5b6101dd600160a060020a03600435166024351515610c9e565b341561040457600080fd5b610211600160a060020a0360043516610dad565b341561042357600080fd5b6101dd600160a060020a03600435166024351515610de1565b341561044757600080fd5b6101dd600160a060020a0360043516610f0a565b341561046657600080fd5b6101dd600160a060020a03600435166024351515610f76565b341561048a57600080fd5b6101dd600160a060020a0360043581169060243516610f9f565b34156104af57600080fd5b6101dd600160a060020a03600435166024351515610fe8565b34156104d357600080fd5b6101dd600160a060020a0360043516602435151561100d565b34156104f757600080fd5b610211600160a060020a0360043516611122565b341561051657600080fd5b6105296004803560248101910135611157565b60405160208082528190810183818151815260200191508051906020019060200280838360005b83811015610568578082015183820152602001610550565b505050509050019250505060405180910390f35b341561058757600080fd5b6101dd600160a060020a036004351660243515156111e5565b600254600160a060020a03165b90565b60005433600160a060020a039081169116146105cb57600080fd5b600160a060020a03811615156105e057600080fd5b60008054600160a060020a031916600160a060020a03838116918217928390559091167f70aea8d848e8a90fb7661b227dc522eb6395c3dac71b63cb59edd5c9899b236460405160405180910390a350565b60005433600160a060020a0390811691161461064d57600080fd5b60028054600160a060020a031916600160a060020a038381169190911791829055167f37d58d4deca971056abaac97f609a16f360952edc136fdf5a48f81cfaf80b6b060405160405180910390a250565b600454600160a060020a031660008181526005602052604090205460ff16905b5090565b600454600160a060020a031690565b600160a060020a0316600090815260096020908152604080832060018085520190915290205468010000000000000000900460ff1690565b600154600160a060020a031690565b600354600160a060020a031690565b60005433600160a060020a0390811691161461074257600080fd5b60048054600160a060020a031916600160a060020a03838116918217835560009182526005602052604091829020805460ff191660011790559154909116907ff62b7326bb5f6084a70482a099d3ded86de8cfbbfcea28e4f5b04ad693bf55ce905160405180910390a250565b600160a060020a0316600090815260096020908152604080832060018085520190915290205462010000900460ff1690565b600160a060020a039081166000908152600a60205260409020541690565b60005433600160a060020a0390811691161480610820575061082033611310565b151561082b57600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805466ff0000000000001916660100000000000090920291909117905560088054909181016108ad838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507fc433d92e44d10de63551410275cfea397c5b0c0a921dc8fb929d73c284ecb379905082604051901515815260200160405180910390a25050565b60005433600160a060020a0390811691161461094b57600080fd5b60018054600160a060020a031916600160a060020a038381169190911791829055167fdb21a20ff3dcd8554e0c246ba9b9c22c3b9c49bc2c0c08382d0934c863398ef460405160405180910390a250565b60005433600160a060020a03908116911614806109bd57506109bd33611310565b15156109c857600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805466ff000000000000191666010000000000009092029190911790556008805490918101610a4a838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a039190911617905550610a9b9050828261133c565b81600160a060020a03167f65bedaa378abbf394977612180c7726f9ed88d11f75847c5a609ded0afdbc9d382604051901515815260200160405180910390a25050565b600054600160a060020a031681565b600160a060020a03166000908152600960209081526040808320600180855201909152902054610100900460ff1690565b600160a060020a031660009081526009602090815260408083206001808552019091529020546601000000000000900460ff1690565b610b5d33611310565b1515610b6857600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805465ff00000000001916650100000000009092029190911790556008805490918101610be8838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507f79ece9769f2bf951b895b98f1611bef27aad2da0a868bc16a81e9d11ddfd4ff1905082604051901515815260200160405180910390a25050565b600160a060020a031660009081526009602090815260408083206001808552019091529020546301000000900460ff1690565b610ca733611310565b1515610cb257600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805461ff0019166101009092029190911790556008805490918101610d2a838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507fb541b66aaab15841e9f8a3a40fc50b777ddd85dc6378cfc6389a973d2117c7d5905082604051901515815260200160405180910390a25050565b600160a060020a03166000908152600960209081526040808320600180855201909152902054640100000000900460ff1690565b60005433600160a060020a0390811691161480610e025750610e0233611310565b1515610e0d57600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805462ff00001916620100009092029190911790556008805490918101610e87838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507ff89e34cb19e9c7d8c84fdaaafb2dce1db4b2e19031ff02be22622530dd80605b905082604051901515815260200160405180910390a25050565b60005433600160a060020a03908116911614610f2557600080fd5b60038054600160a060020a031916600160a060020a038381169190911791829055167f357d1ba45e9ef3fb937f4b33a26a6efed1b2f40114460d16fbfce82aca41575560405160405180910390a250565b60005433600160a060020a03908116911614610f9157600080fd5b610f9b828261133c565b5050565b60005433600160a060020a03908116911614610fba57600080fd5b600160a060020a039182166000908152600a602052604090208054600160a060020a03191691909216179055565b60005433600160a060020a0390811691161461100357600080fd5b610f9b8282611445565b61101633611310565b151561102157600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805464ff000000001916640100000000909202919091179055600880549091810161109f838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507fb4e51190ac09d88100031de9d538eda33e031ff4ea0598f973dcb1531ce12eb1905082604051901515815260200160405180910390a25050565b600160a060020a0316600090815260096020908152604080832060018085520190915290205465010000000000900460ff1690565b61115f611558565b600783836040518083838082843782019150509250505090815260200160405180910390208054806020026020016040519081016040528092919081815260200182805480156111d857602002820191906000526020600020905b8154600160a060020a031681526001909101906020018083116111ba575b5050505050905092915050565b60005433600160a060020a0390811691161480611206575061120633611310565b151561121157600080fd5b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805463ff00000019166301000000909202919091179055600880549091810161128d838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507f535a127f1000c5fa3267e0a84f04d11295bf38e2ad4d65355edfc9718a661e65905082604051901515815260200160405180910390a25050565b600160a060020a0316600090815260096020908152604080832060018085520190915290205460ff1690565b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a86151590810291909117855580845260019094019091529020805468ff00000000000000001916680100000000000000009092029190911790556113b98282611445565b60088054600181016113cb838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507f1679749591538f58df6938d50167216de9dda7d8a999dbb21d9f098383a13e02905060405160405180910390a25050565b600160a060020a03821660008181526009602090815260408083208054600160a060020a03191690941760a060020a60ff02191660a060020a8615159081029190911785558084526001948501909252909120805460ff1916909117905560088054909181016114b5838261152f565b916000526020600020900160006020604051908101604052600160a060020a038616815291905081518154600160a060020a031916600160a060020a0391821617909155841691507f0ca44eaf19ec8e07aaa42c7f82892b8ff7de9faf7b420a750585730a0b0b3878905060405160405180910390a25050565b8154818355818115116115535760008381526020902061155391810190830161156a565b505050565b60206040519081016040526000815290565b6105ad91905b808211156106be578054600160a060020a03191681556001016115705600a165627a7a72305820ad2035fb5fd72a7726b38b1b879c48dc7a67574238432d4e663623dd3ee6f0770029
```
ABI
```
[
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "old",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "current",
				"type": "address"
			}
		],
		"name": "NewOwner",
		"type": "event"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_authority",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
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
				"name": "_casper",
				"type": "address"
			}
		],
		"name": "setCasper",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_dragoEventful",
				"type": "address"
			}
		],
		"name": "setDragoEventful",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_exchange",
				"type": "address"
			},
			{
				"name": "_adapter",
				"type": "address"
			}
		],
		"name": "setExchangeAdapter",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "dragoEventful",
				"type": "address"
			}
		],
		"name": "NewDragoEventful",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "drago",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "isWhitelisted",
				"type": "bool"
			}
		],
		"name": "WhitelistedDrago",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "vault",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedVault",
		"type": "event"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_exchangeEventful",
				"type": "address"
			}
		],
		"name": "setExchangeEventful",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "factory",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedFactory",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "registry",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedRegistry",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "exchange",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedExchange",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "casper",
				"type": "address"
			}
		],
		"name": "NewCasper",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "asset",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedAsset",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "target",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "WhitelistedUser",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "whitelister",
				"type": "address"
			}
		],
		"name": "SetWhitelister",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "authority",
				"type": "address"
			}
		],
		"name": "SetAuthority",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "exchangeEventful",
				"type": "address"
			}
		],
		"name": "NewExchangeEventful",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "vaultEventful",
				"type": "address"
			}
		],
		"name": "NewVaultEventful",
		"type": "event"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_new",
				"type": "address"
			}
		],
		"name": "setOwner",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_vaultEventful",
				"type": "address"
			}
		],
		"name": "setVaultEventful",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_whitelister",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "setWhitelister",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_asset",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistAsset",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_drago",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistDrago",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_exchange",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistExchange",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_factory",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistFactory",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_registry",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistRegistry",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_target",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistUser",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_vault",
				"type": "address"
			},
			{
				"name": "_isWhitelisted",
				"type": "bool"
			}
		],
		"name": "whitelistVault",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getCasper",
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
		"name": "getDragoEventful",
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
				"name": "_exchange",
				"type": "address"
			}
		],
		"name": "getExchangeAdapter",
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
		"name": "getExchangeEventful",
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
				"name": "_group",
				"type": "string"
			}
		],
		"name": "getListsByGroups",
		"outputs": [
			{
				"name": "",
				"type": "address[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getVaultEventful",
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
				"name": "_authority",
				"type": "address"
			}
		],
		"name": "isAuthority",
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
		"inputs": [],
		"name": "isCasperInitialized",
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
				"name": "_asset",
				"type": "address"
			}
		],
		"name": "isWhitelistedAsset",
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
				"name": "_drago",
				"type": "address"
			}
		],
		"name": "isWhitelistedDrago",
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
				"name": "_exchange",
				"type": "address"
			}
		],
		"name": "isWhitelistedExchange",
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
				"name": "_factory",
				"type": "address"
			}
		],
		"name": "isWhitelistedFactory",
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
				"name": "_registry",
				"type": "address"
			}
		],
		"name": "isWhitelistedRegistry",
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
				"name": "_target",
				"type": "address"
			}
		],
		"name": "isWhitelistedUser",
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
				"name": "_vault",
				"type": "address"
			}
		],
		"name": "isWhitelistedVault",
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
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
```
