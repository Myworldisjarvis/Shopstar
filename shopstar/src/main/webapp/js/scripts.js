function add_to_cart(pid, pname, price, pquantity) {
    const addToCartButton = document.querySelector(`button[data-product-id="${pid}"]`);

    let cart = localStorage.getItem("cart");
    if (cart === null) {
        let products = [];
        let product = { 
            productId: pid, 
            productName: pname, 
            productQuantity: 1, 
            productPrice: price,
            stockAvailable: pquantity // Adding stock available to the product
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        toastr.success("Product is added to cart");
    } else {
        let pcart = JSON.parse(cart);
        let existingProduct = pcart.find(item => item.productId === pid);

        if (existingProduct) {
            if (existingProduct.productQuantity < pquantity) {
                existingProduct.productQuantity += 1;
                localStorage.setItem("cart", JSON.stringify(pcart));
                toastr.success(`${existingProduct.productName} Quantity Increased To ${existingProduct.productQuantity}`);
            } else {
                toastr.error(`Only ${pquantity} items in stock.`);
                addToCartButton.disabled = true;
            }
        } else {
            let product = { 
                productId: pid, 
                productName: pname, 
                productQuantity: 1, 
                productPrice: price,
                stockAvailable: pquantity // Adding stock available to the product
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            toastr.success("Product is added to cart");
        }
    }

    if (pquantity > 0) {
        addToCartButton.disabled = false;
    }

    updateCart();
}

// Function to update the cart view
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart === null || cart.length === 0) {
        $(".cart-items").html("(0)");
        $(".card-bodys").html("<h3>Cart does not have any items</h3>");
        /*$(".checkout-btn").addClass('disabled');*/
        $(".checkout-btn").attr('disabled',true);
    } else {
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

        let totalPrice = 0;
        cart.forEach(item => {
            table += `
            <tr>
                <td>${item.productName}</td>
                <td>&#8377;${item.productPrice}</td>
                <td>
                    <button class="btn btn-sm btn-primary" style="font-size: 0.65rem;" onclick="changeQuantity(${item.productId}, -1, ${item.productPrice})">-</button>
                    ${item.productQuantity}
                    <button class="btn btn-sm btn-primary" style="font-size: 0.65rem;" onclick="changeQuantity(${item.productId}, 1, ${item.productPrice})">+</button>
                </td>
                <td>&#8377;${item.productQuantity * item.productPrice}</td>
                <td><button class="btn btn-danger btn-sm" onclick="removeFromCart(${item.productId})">Remove</button></td>
            </tr>
            `;
            totalPrice += item.productQuantity * item.productPrice;
        });

        table += `
            </tbody>
            <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : &#8377;${totalPrice}</td></tr>
        </table>
        `;
        $(".card-bodys").html(table);
        /*$(".checkout-btn").removeClass('disabled');*/
        $(".checkout-btn").attr('disabled',false);
    }
        
}


// Function to change the quantity of a product in the cart
function changeQuantity(productId, change, price) {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart) {
        let product = cart.find(item => item.productId === productId);

        if (product) {
            let stockAvailable = product.stockAvailable;

            // Ensure quantity doesn't exceed stock or go below 1
            if (product.productQuantity + change > 0 && product.productQuantity + change <= stockAvailable) {
                product.productQuantity += change;
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCart();
            } else if (product.productQuantity + change > stockAvailable) {
                Swal.fire({
                    title: 'Out of Stock',
                    text: `Only ${stockAvailable} items in stock.`,
                    icon: 'error',
                    confirmButtonText: 'Okay',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                    },
                    buttonsStyling: false,
                });
            } else if (product.productQuantity + change < 1) {
                Swal.fire({
                    title: 'Invalid Quantity',
                    text: 'Quantity cannot be less than 1.',
                    icon: 'warning',
                    confirmButtonText: 'Okay',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                    },
                    buttonsStyling: false,
                });
            }
        }
    }
}


// Function to remove a product from the cart
function removeFromCart(productId) {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart) {
        cart = cart.filter(item => item.productId !== productId);
        localStorage.setItem("cart", JSON.stringify(cart));
        toastr.info("Product removed from the cart ");
        updateCart();
    }
}

$(document).ready(function(){
    updateCart(); // Initialize cart view on page load
});



function goToCheckout(){
	window.location="checkout.jsp";
}

