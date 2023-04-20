from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class OrderProducts:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def order_product_and_checkout(self,product):
        prductTitles = self.selLib.get_webelements("css:.inventory_item_name")
        for productTitle in prductTitles:
            if productTitle.text in product:
                if productTitle.text == "Sauce Labs Backpack":
                    self.selLib.click_button("css:#add-to-cart-sauce-labs-backpack")


