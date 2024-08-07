function add_to_cart(pid, pname, price, pquantity) {
			const messageBox = document.getElementById(`message-box-${pid}`);
			const showMessage = (message) => {
				messageBox.innerHTML = message;
				messageBox.style.display = "block";
				setTimeout(() => {
					messageBox.style.display = "none";
				}, 3000); // Hide message after 3 seconds
			};

			let cart = localStorage.getItem("cart");
			if (cart === null) {
				// No cart yet
				let products = [];
				let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
				products.push(product);
				localStorage.setItem("cart", JSON.stringify(products));
				showMessage("Product is added to cart");
			} else {
				// Cart already exists
				let pcart = JSON.parse(cart);

				let existingProduct = pcart.find(item => item.productId === pid);

				if (existingProduct) {
					if (existingProduct.productQuantity < pquantity) {
						// Only increment if within available stock
						existingProduct.productQuantity += 1;
						localStorage.setItem("cart", JSON.stringify(pcart));
						showMessage(`${existingProduct.productName} quantity increased to ${existingProduct.productQuantity}`);
					} else {
						showMessage(`Only ${pquantity} items in stock.`);
					}
				} else {
					// Product is not in cart, add new
					let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
					pcart.push(product);
					localStorage.setItem("cart", JSON.stringify(pcart));
					showMessage("Product is added to cart");
				}
			}
		}