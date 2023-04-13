from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop():

    def __init__(self):
       self.selib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_world(self):
        print('hello')

    @keyword
    def add_items_to_cart_and_checkout(self, prodouctsList):
        #Get WebElements
        i = 1
        productsTitles = self.selib.get_webelements("css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in prodouctsList:
                self.selib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1
        self.selib.click_link('css:li.active a')







