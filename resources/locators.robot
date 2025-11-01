*** Variables ***

# --- Login Page ---
${LOGIN_USERNAME}    id:user-name
${LOGIN_PASSWORD}    id:password
${LOGIN_BUTTON}      id:login-button
${LOGOUT_BUTTON}     id:logout_sidebar_link
${BURGER_MENU_BUTTON}       id:react-burger-menu-btn


# --- Product Page ---
${INVENTORY_LIST}          class:inventory_list
${PRODUCT_ITEM}            xpath://div[@class='inventory_item']
${CART_ICON}               id:shopping_cart_container

# --- Cart / Checkout Page ---
${CHECKOUT_BUTTON}         id:checkout
${FIRST_NAME_FIELD}        id:first-name
${LAST_NAME_FIELD}         id:last-name
${POSTAL_CODE_FIELD}       id:postal-code
${CONTINUE_BUTTON}         id:continue
${FINISH_BUTTON}           id:finish
${SUCCESS_MESSAGE}         xpath://h2[contains(text(),'Thank you for your order')]