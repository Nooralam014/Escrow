pragma solidity ^0.4.24;

contract Excercise {
    constructor() public {}

    struct Item {
        uint256 itemId;
        string title;
        uint256 price;
        address seller;
        uint256 sellerId;
    }
    struct Escrow {
        uint256 escrowId;
        uint256 itemId;
        uint256 payment;
        address seller;
        address buyer;
        uint256 sellerId;
        uint256 buyerId;
        bool complain;
        bool accepted;
        string complaint;
    }
    struct Buyer {
        uint256 buyerId;
        uint256 balance;
    }
    struct Seller {
        uint256 sellerId;
        uint256 balance;
    }

    uint256 oId = 0;
    uint256 iId = 0;
    uint public totalEscrow = 0;
    uint[] arr;
    
    mapping(uint256 => Item) public ItemsDetail;
    mapping(uint256 => Escrow) public OrderDetail;
    mapping(uint256 => Buyer) private BuyerMap;
    mapping(uint256 => Seller) private SellerMap;
    Escrow[] public escrowLength;

    function setBuyerBalance(uint256 amount, uint256 _buyerId) public {
        BuyerMap[_buyerId].balance = amount;
    }

    function setSellerBalance(uint256 amount, uint256 _sellerId) public {
        SellerMap[_sellerId].balance = amount;
    }

    function buyerBalance(uint256 buyerId) public view returns (uint256) {
        return (BuyerMap[buyerId].balance);
    }

    function sellerBalance(uint256 sellerId) public view returns (uint256) {
        return (SellerMap[sellerId].balance);
    }

    function addItem(
        string memory _title,
        uint256 _price,
        uint256 _sellerId
    ) public {
          iId += 1;
        ItemsDetail[iId] = Item(
            iId,
            _title,
            _price,
            msg.sender,
            _sellerId
        );
    }


    function BuyItem(uint256 _itemId, uint256 _buyerId ) public {
        require(
            ItemsDetail[_itemId].seller != msg.sender &&
                BuyerMap[_buyerId].balance >= ItemsDetail[_itemId].price && ItemsDetail[_itemId].itemId != 0 
        );
        oId += 1;
        uint256 _sellerId = ItemsDetail[_itemId].sellerId;
        OrderDetail[oId] = Escrow(
            oId,
            _itemId,
            ItemsDetail[_itemId].price,
            ItemsDetail[_itemId].seller,
            msg.sender,
            _sellerId,
            _buyerId,
            false,
            false,
            ""
        );
        escrowLength.push(
            Escrow({
            escrowId:oId,
            itemId:_itemId,
            payment: ItemsDetail[_itemId].price,
            seller: ItemsDetail[_itemId].seller,
            buyer:msg.sender,
            sellerId:_sellerId,
            buyerId:_buyerId,
            complain:false,
            accepted:false,
            complaint:""
            })
        );
        BuyerMap[_buyerId].balance -= ItemsDetail[_itemId].price;
        totalEscrow += ItemsDetail[_itemId].price;
    }

    function acceptOrder(uint256 _orderId) public {
        require(
            OrderDetail[_orderId].buyer == msg.sender &&
                OrderDetail[_orderId].complain == false &&
                OrderDetail[_orderId].accepted == false
        );

        OrderDetail[_orderId].accepted = true;
        uint256 _sellerId = OrderDetail[_orderId].sellerId;
        SellerMap[_sellerId].balance += OrderDetail[_orderId].payment;
        totalEscrow -=OrderDetail[_orderId].payment;
    }

    function rejectOrder(uint256 _orderId, string memory _complaint ) public {
        require(
            OrderDetail[_orderId].buyer == msg.sender &&
                OrderDetail[_orderId].complain == false &&
                OrderDetail[_orderId].accepted == false
        );
        OrderDetail[_orderId].complain = true;
        OrderDetail[_orderId].complaint = _complaint;
        uint256 _buyerId = OrderDetail[_orderId].buyerId;
        BuyerMap[_buyerId].balance += OrderDetail[_orderId].payment;
        totalEscrow -=OrderDetail[_orderId].payment;
    }
    function myOrders(uint256 _buyerId) public view returns (uint[]) {
        for(uint256 i =0; i<escrowLength.length; i++)
        {
            if(escrowLength[i].buyerId == _buyerId)
            {
                arr.push(escrowLength[i].escrowId);
            }
        }
        return arr;
    }
}
