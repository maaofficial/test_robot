from robot.api import logger
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return  driver_path
    
class MyLibrary:
    """Give this library a proper name and document it."""

    def example_python_keyword(self):
        logger.info("This is Python!")