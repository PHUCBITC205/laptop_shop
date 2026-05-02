const GUEST_CART_KEY = 'guest_cart';

const GuestCart = {
    get() {
        const cart = localStorage.getItem(GUEST_CART_KEY);
        return cart ? JSON.parse(cart) : [];
    },

    set(cart) {
        localStorage.setItem(GUEST_CART_KEY, JSON.stringify(cart));
        this.updateBadge();
    },

    add(productId, quantity) {
        let cart = this.get();
        const pid = parseInt(productId);
        const existingItem = cart.find(item => item.productId === pid);
        if (existingItem) {
            existingItem.quantity += parseInt(quantity);
            if (existingItem.quantity < 1) existingItem.quantity = 1;
        } else {
            cart.push({ productId: pid, quantity: parseInt(quantity) });
        }
        this.set(cart);
    },

    update(productId, quantity) {
        let cart = this.get();
        const pid = parseInt(productId);
        const existingItem = cart.find(item => item.productId === pid);
        if (existingItem) {
            existingItem.quantity = parseInt(quantity);
            if (existingItem.quantity < 1) existingItem.quantity = 1;
            this.set(cart);
        }
    },

    remove(productId) {
        let cart = this.get();
        const pid = parseInt(productId);
        cart = cart.filter(item => item.productId !== pid);
        this.set(cart);
    },

    clear() {
        localStorage.removeItem(GUEST_CART_KEY);
        this.updateBadge();
    },

    count() {
        return this.get().length;
    },

    updateBadge() {
        const badge = document.getElementById('showCartId');
        if (badge) {
            const count = this.count();
            // If logged in, the badge is handled by sessionScope.sum initially, 
            // but we can override it if we are in guest mode.
            // Check if user is logged in via a global variable or presence of user-specific elements.
            const isLoggedIn = document.getElementById('isLoggedInFlag') !== null;
            if (!isLoggedIn) {
                badge.innerText = count;
            }
        }
    },

    sync(csrfToken) {
        const cart = this.get();
        if (cart.length === 0) return;

        $.ajax({
            url: '/api/sync-cart',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(cart),
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: (response) => {
                if (isNaN(response)) {
                    window.location.href = '/login';
                    return;
                }
                console.log('Cart synced successfully');
                this.clear();
                // Optionally refresh or update the badge with the new server count
                const badge = document.getElementById('showCartId');
                if (badge) badge.innerText = response;
            },
            error: (err) => {
                console.error('Error syncing cart:', err);
            }
        });
    }
};

$(document).ready(() => {
    GuestCart.updateBadge();
    
    // Check if we just logged in
    const justLoggedIn = document.getElementById('justLoggedInFlag') !== null;
    const csrfToken = $("meta[name='_csrf']").attr("content");
    
    if (justLoggedIn && csrfToken) {
        GuestCart.sync(csrfToken);
    }
});
