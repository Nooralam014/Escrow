Introduction:
This file contains the information about Seller/Buyer Escrow Contract. The portions will be divided in smaller parts for better understanding.


Solidity Version:
This project is made in solidity using version ^0.4.24


Structs:
First and foremost one of the most important thing of solving an excercise is understanding basic concept/functionality required.
In this specific problem the structs required for complete working are as follows
1: Item (Main thing to sell)
2: Escrow (Basic Order details)
3: Seller (An Entity which is listing items to sell)
4: Buyer (An Entity which is buying items and giving balance)


Declarations:
We all know that we have to store data in blockchain,thats why we are using 2 methods for that.
1: Mapping (Pro: Key/value pair, data can be accessed by giving key. Con: As the data is stored via mapping we cant gather data without giving proper key)
2: Array (Pro: Pushing in array so we can get any index. Con: Memory management)


Functions:
Here is list of every function that is used

setBuyerBalance:
Takes amount and buyerId and map balance against that buyerId 

setSellerBalance:
Takes amount and sellerId and map balance against that sellerId

buyerBalance:
Takes buyerId as a param and return the remaining balance of that buyer

sellerBalance:
Takes sellerId as a param and return the remaining balance of that seller

addItem:
Take 3 params of title,price and sellerId and creates an item through incremental Mapping (dont pass specific key, just increment it)
Here we take 3 params and set them but also have default values for making it functional (check Struct of Item) 

BuyItem:
This is basically our Order i.e Escrow Struct. Here we take 2 params and create some require statements according to our requirement.
In here there are manyt default values i.e. seller, price, id, bools.
One most important thing in this function is that we subtract the balance of buyer in this function but not give it to seller because of review wait

acceptOrder:
If Buyer dont have any issue, he accepts order and the payment that was in Escrow Wallet is transfered to Seller.

rejectOrder:
If Buyer have any issue, he rejects order and the payment that was in Escrow Wallet is transfered to Buyer. Buyer can also putup complain.

myOrders:
Return the list of orders against particular buyer. Uses array because in mapping we cant get all data as keys are specific


Miscellaneous:
An Important information to know is that in Mapping if you set it to public we can use it in test environment by giving the key and getting the data against it
In our System there are ItemsDetail and OrderDetail which are mapped publicly so we can see that
Another Important thing to know is totalEscorw (total Balance in circulation) we calculate it in multiple steps. We set it up publically so accessible,
then functions in which balance is changed we update the value these functions are
1: BuyItem (add in circulation because in our wallet)
2: acceptOrder (remove from circulation because removed from our wallet)
3: rejectOrder (remove from circulation because removed from our wallet)


Conclusion:
This is a simple effort which definitely can have many improvements but it provides as a simple baseline for creating wallets. Moreover, this System
is tested on kovan and works as expected.