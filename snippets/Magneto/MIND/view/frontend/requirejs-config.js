config = {
    map: {
        '*': {
            shipping_cost: 'TBG_Checkout/js/tbg_checkout_script'
        }
    },
    deps: [
        'Amasty_Shopby/js/amShopbyResponsive',
        'Amasty_Shopby/js/amShopby'
    ],
    paths: {
         'swiper': 'Amasty_ShopbyBase/js/swiper.min'
    },
    shim: {
         'swiper': {
             deps: ['jquery']
         }
    },
    config: {
        mixins: {
            /**
             * Mixins for rendering order summary in the shipping step of checkout.
             */
            'Magento_Checkout/js/view/summary/abstract-total': {
                'TBG_Checkout/js/view/summary/abstract-total-mixins': true
            }
        }
    }