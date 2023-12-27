
### Run

```shell
$ forge script src/ContractB.sol:ContractB -vvvv
```
### Output 

```
== Logs ==
  --------------------------------WEIRD BEHAVIOUR--------------------------------
  ContractA deployed at 0x90193C961A926261B756D1E5bb255e67ff9498A1
  ContractB deployed at 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496
  ContractA delegateCall sender 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
  ContractA delegateCall s_delegate 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496
  ContractB getOne called 0
  ContractA delegateCall sender 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
  ContractA delegateCall s_delegate 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496
  ContractB getTwo called 0
  --------------------------------EXPECTED BEHAVIOUR--------------------------------
  ContractB deployed at 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496
  ContractA deployed at 0xDEb1E9a6Be7Baf84208BB6E10aC9F9bbE1D70809
  ContractB deployed at 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496
  ContractBNoScript deployed at 0xD718d5A27a29FF1cD22403426084bA0d479869a0
  ContractA delegateCall sender 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
  ContractA delegateCall s_delegate 0xD718d5A27a29FF1cD22403426084bA0d479869a0
  ContractBNoScript getOne called 1
  ContractA delegateCall sender 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
  ContractA delegateCall s_delegate 0xD718d5A27a29FF1cD22403426084bA0d479869a0
  ContractBNoScript getTwo called 2
```
