Headless Chrome with Chromedriver
=================================

This contains a `Dockerfile` that runs Chrome in headless mode with Chromedriver so you can connect to it using Selenium or anything else that supports the WebDriver protocol (e.g. Codeception).

Run the image:

```
docker run -it -p:4444:4444 retreatguru/headless-chromedriver
```

Python example:

```
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote('http://127.0.0.1:4444', DesiredCapabilities.CHROME)
driver.get('http://example.com');
driver.save_screenshot('example.png');
```
