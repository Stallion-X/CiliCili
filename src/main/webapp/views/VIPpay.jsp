<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.alipay.api.*" %>
<%@page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@page import="com.alipay.api.domain.AlipayTradePagePayModel" %>
<%@page import="com.alipay.api.response.AlipayTradePagePayResponse" %>
<%@page import="java.util.*" %>
<%@ page import="com.cilicili.Utils.GeneratePayNum" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Paying...</title>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
</head>
<body>
<%
    String privateKey = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCJym6bMwGFj6HR3dqiWBO64mMTFmQnnRBRzPmuloVbJhvnCM7RlJ0W8op3Dl1UTE0FXxQqhqMQ7KAcA5juTRU2pdx28/GualtO3sKHwLvb2bpBlsUouLSFVIo5zyA26R9wVlgCuaT3iLczslB/GbB/N26K9TrzfyeMehZlycMpdCwaebhvG/VH1UL8z5w7jsp6EG7JUkGaqKCSm0uaxurTkJaat0nYdgaZKEdaB1Mx3fleR+TZfP65aEm3NHiSowrb6YwR3Lb3UNmoncsPmsZ1fCmzlr3alnb49VWSfYn0AZPvo413e3TOu2ex25HxDzj31Ymqcg2QXHd5Letk5jLNAgMBAAECggEAMNa0f4QDrRBs3dMR1Gr9i0cEsNZF55iPGT9a3FvzpowKZchEbhqL139ePrazs9ZbkmTR5ATWtX/5fBR2VzixJS6CxxLN/fEqrfjc4Hsa2uEAWJEVDsrxCTUezUCx/WSBxTKFfWnJpAcsUEGKsJItcdn273/eRkIyhWMcnzV1XDKQsOht4eMHgLb3sVTOHNiZVLE/5fjn+biXPJVCcmOiIgfB6QIrCGz21EJOXFCY9qNhEKBdnMtJtRBJb7Qu9H5MJK4FgQCF4/1dc/SRjG9Fhe3pE51wwMF/lYDnL4K9uPNdMbFGtXiqR4bWGxQQKUbZnfZsImL+AQCwDlkTDEvwDQKBgQDHhzzrgvswK7qM/Ybp808SWWA0jtCsfXVmWd34aPED7aZm3h34h+mENUGH9Ad5xmZKVsGEyS2Sai4ujfW81l/ErlLn6ZxNJzo3h7BsWRT5eA2QAkrl7eNkzYg86T+P65kPQf2dTj6ZvN44cws9TVQ+2YbUEcx2KQj/oHK0bIg0ewKBgQCwygUl8bSY8Q1h5RfhfN1scf4l+yZ5kP/cQdZR0in2TwritF2VvycYD1wqnK9DSDgyWiGh4Ks4VPrXe6l+o+HYFNstT0aQZtZ86H1tVmFHUU5McVC7i0u0OqbClbbWlScb2UYkR+HWpfsklAj5c1PKk75hkMQBF53eSJ+D7HcHVwKBgQCsLF69O0FVx+YqU3tf1bydsNH7iGE49umfcFzCRovzP9cfXPuvwlgW5X2uuzzYMAOEkmhbFN5mQYmoUoeCc9of9e1EgamGShtKX6Q1Wolm29mYMuI+lpBqI5E0PnHC1yI0sFUQsLwEHZ4ESAGi3F+d/EcEKHeuXqqNKv7QAfdmkQKBgB9Z1AvkjyhIJx1jKRb9s66VkIJfxXTtd9IxgrZD1NkvLzkAz0/M9DvaDXgpDRObbQvQ3AH++54jw9AOyAIDQfu1xyCD3HmjIwpHmGaZWOryyjXYKn73ttchR41eS2xGSwcvQrcQYEZWbPERp33FK+jSxoI6z+d5rq9Kpa8ZcgpFAoGBAIqMmBdg6YgHrterDWvKDNYdJfrL31gYB8Y2uXpjZ0MppD621vS3KF6Wc4sV2TjpmiHoy9ZCvE5BVGURoD6mqf69Xc7/rTs4VNewQheS42agsc1iqccro8IVxXJKMLa3ffG/CJwxblCVrvsetvgF+/prCTh/YZNkUDDsyWpicVy1";
    String alipayPublicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlufLJAaqrxBP3iWEs3bF4hiU7hTuSYA3vqf3YoZ8LcP2HygCxjjuajs7TWkh6pdLk/Ufp8q7IAzIBS5Wz0gWIqgYgit+vEqt/kiupmGtOXemvgL2537HBez+HQ5NVZUc4F2L0R6Ym0nB6HBUWLvx4uUTnTAuTWeheebqK0bZhpw7YaGulRuw8aKaNjcHVZ6e9WOOoEWuLSc2vsZekFZ9xxHedeqzd71nNEselTKH7u0xptigThokjyQRC3i5hiwEMRIwoc2HnJhtViOwkF3/YFg3L8idfZpfd95cOB78iktZxF91w+eTAfjhDGNj/RedMjLzzktyy1aEaMx8UY7J5QIDAQAB";
    AlipayConfig alipayConfig = new AlipayConfig();
    alipayConfig.setServerUrl("https://openapi.alipaydev.com/gateway.do");
    alipayConfig.setAppId("2021000121612084");
    alipayConfig.setPrivateKey(privateKey);
    alipayConfig.setFormat("json");
    alipayConfig.setAlipayPublicKey(alipayPublicKey);
    alipayConfig.setCharset("UTF8");
    alipayConfig.setSignType("RSA2");
    AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig);
    AlipayTradePagePayRequest arequest = new AlipayTradePagePayRequest();
    arequest.setReturnUrl("http://localhost:8080/returnUrl");
    arequest.setNotifyUrl("http://150.158.145.94:8080/");
    AlipayTradePagePayModel model = new AlipayTradePagePayModel();
    model.setOutTradeNo(GeneratePayNum.generateOrder());
    model.setTotalAmount("233.33");
    model.setSubject("CiliCili大会员");
    model.setProductCode("FAST_INSTANT_TRADE_PAY");
    arequest.setBizModel(model);
    AlipayTradePagePayResponse aresponse = alipayClient.pageExecute(arequest);
    out.print(aresponse.getBody());
    if (aresponse.isSuccess()) {
        System.out.println("调用成功");
    } else {
        System.out.println("调用失败");
    }
%>
</body>
</html>