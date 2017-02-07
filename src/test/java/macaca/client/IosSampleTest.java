package macaca.client;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import macaca.client.commands.Element;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.io.File;

import static org.hamcrest.CoreMatchers.containsString;

public class IosSampleTest {
    MacacaClient driver = new MacacaClient();

    @Before
    public void setUp() throws Exception {
        // platform: android or ios
        String platform = "ios";

        /*
           Desired Capabilities are used to configure webdriver when initiating the session.
           Document URL: https://macacajs.github.io/desired-caps.html
         */
        JSONObject porps = new JSONObject();
        porps.put("platformName", platform);
        // It takes time to download. Patient or just build your own using https://github.com/xudafeng/ios-app-bootstrap
        porps.put("app", "https://npmcdn.com/ios-app-bootstrap@latest/build/ios-app-bootstrap.zip");
        porps.put("reuse", 1);

        porps.put("deviceName", "iPhone 6s");

        JSONObject desiredCapabilities = new JSONObject();
        desiredCapabilities.put("desiredCapabilities", porps);
        driver.initDriver(desiredCapabilities);
    }

    @Test
    public void test_case_1() throws Exception {
        // set screenshot save path
        File directory = new File("");
        String courseFile = directory.getCanonicalPath();


        System.out.println("------------#1 login test-------------------");

        driver.elementByXPath("//XCUIElementTypeTextField[1]").sendKeys("中文+Test+12345678");
        driver.elementByXPath("//XCUIElementTypeSecureTextField[1]").sendKeys("111111");
        driver.elementByName("Login").click();

        System.out.println("------------#2 scroll tableview test-------------------");

        driver.elementByName("HOME").click();
        driver.elementByName("list").click();
        driver.sleep(1000);

        // 拖拽一个元素或者在多个坐标之间移动
        driver.drag(200,420,200,20,2, 100);


        System.out.println("------------#3 webview test-------------------");

        driver.back().elementByName("Webview").click();
        driver.sleep(3000);
        // save screen shot
        driver.saveScreenshot(courseFile + "/webView.png");

        // 这里需要两次switch to webview 是因为，pushView 多了一个 webview。
        Element ele = switchToWebView(driver).elementById("pushView");
        ele.click();
        switchToWebView(driver).elementById("popView").click();

        System.out.println("------------#4 baidu web test-------------------");
        switchToNative(driver).elementByName("Baidu").click();
        driver.sleep(10000);
        driver.saveScreenshot(courseFile + "/baidu.png");

        Element input = switchToWebView(driver).elementById("index-kw");
        input.sendKeys("中文+TesterHome");
        driver.elementById("index-bn").click();
        driver.sleep(10000);
        String source = driver.source();

        Assert.assertThat(source, containsString("TesterHome"));

        System.out.println("------------#5 logout test-------------------");

        switchToNative(driver).elementByName("PERSONAL").click();
        driver.sleep(1000);
        driver.elementByName("Logout").click();
        driver.sleep(1000);
    }

    // switch to the context of the last pushed webview
    public  MacacaClient switchToWebView(MacacaClient driver) throws Exception {
        JSONArray contexts = driver.contexts();
        return driver.context(contexts.get(contexts.size()-1).toString());
    }

    // switch to the context of native
    public  MacacaClient switchToNative(MacacaClient driver) throws Exception {
        JSONArray contexts = driver.contexts();
        return driver.context(contexts.get(0).toString());
    }

    @After
    public void tearDown() throws Exception {
        driver.quit();
    }
}
