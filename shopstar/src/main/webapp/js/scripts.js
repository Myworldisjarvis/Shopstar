function add_to_cart(pid, pname, price, pquantity) {
    const messageBoxId = `message-box-${pid}`;
    let messageBox = document.getElementById(messageBoxId);
    const addToCartButton = document.querySelector(`button[data-product-id="${pid}"]`);

    if (!messageBox) {
        messageBox = document.createElement('div');
        messageBox.id = messageBoxId;
        messageBox.className = 'message-box';
        addToCartButton.parentNode.insertBefore(messageBox, addToCartButton);
    }

    const showMessage = (message, isError = false) => {
        messageBox.innerHTML = message;
        messageBox.className = `message-box ${isError ? 'error' : 'success'}`;
        messageBox.style.display = "block";
        setTimeout(() => {
            messageBox.style.display = "none";
        }, 3000);
    };

    let cart = localStorage.getItem("cart");
    if (cart === null) {
        let products = [];
        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showMessage("Product is added to cart");
    } else {
        let pcart = JSON.parse(cart);
        let existingProduct = pcart.find(item => item.productId === pid);

        if (existingProduct) {
            if (existingProduct.productQuantity < pquantity) {
                existingProduct.productQuantity += 1;
                localStorage.setItem("cart", JSON.stringify(pcart));
                showMessage(`${existingProduct.productName} Quantity Increased To ${existingProduct.productQuantity}`);
            } else {
                showMessage(`Only ${pquantity} items in stock.`, true);
                addToCartButton.disabled = true;
            }
        } else {
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            showMessage("Product is added to cart");
        }
    }

    if (pquantity > 0) {
        addToCartButton.disabled = false;
    }

    updateCart();
}

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart === null || cart.length === 0) {
        console.log("cart is empty!!");
        $(".cart-items").html("(0)");
        $(".card-bodys").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").addClass('disabled');
    } else {
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
        <table class='table'>
            <thead class='thead-light'>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
        `;

		let totalPrice=0;
        cart.forEach(item => {
            table += `
            <tr>
                <td>${item.productName}</td>
                <td>&#8377;${item.productPrice}</td>
                <td>${item.productQuantity}</td>
                <td>&#8377;${item.productQuantity * item.productPrice}</td>
                <td><button class="btn btn-danger btn-sm" onclick="removeFromCart(${item.productId})">Remove</button></td>
            </tr>
            `;
            totalPrice+=item.productPrice*item.productQuantity;
            
        });

        table += `
            </tbody>
            <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice}</td></tr>
        </table>
        `;
        $(".card-bodys").html(table);
    }
}

function removeFromCart(productId) {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart) {
        cart = cart.filter(item => item.productId !== productId);
        localStorage.setItem("cart", JSON.stringify(cart));
        updateCart();
    }
}

$(document).ready(function(){
    updateCart();
});
