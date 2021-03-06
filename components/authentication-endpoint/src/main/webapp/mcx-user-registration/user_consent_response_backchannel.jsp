<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="site no-js lang--en" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Mobile Connect</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="stylesheet" href="mcx-user-registration/mcresources/css/style.css">

    <noscript>
        <!-- Fallback synchronous download, halt page rendering if load is slow  -->
        <link href="//fonts.googleapis.com/css?family=Roboto:400,300,700,400italic,300italic,700italic" rel="stylesheet"
              type="text/css">
    </noscript>
    <!-- loads fonts asyncronously preventing font loading from block page render -->
    <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>
    <%
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            String endpoint = "/sessionupdater/tnspoints/endpoint/serverinitiated/api/sms/response/"+id;
            boolean newUser = Boolean.valueOf(request.getParameter("newUser"));
    %>
    <script type="application/javascript">
        $(document).ready(function() {

            getUserChallanges();
            var finalResult;

            function getUserChallanges() {

                var url = "<%=endpoint%>";

                $.ajax({
                    type: "GET",
                    url: url,
                    data: {"id": "<%=id%>", "action": "<%=action%>", "newUser":"<%=newUser%>"},
                    success: function (result) {
                        var json = JSON.parse(result);
                        finalResult = json.status;

                        if (finalResult == "REJECTED") {
                            $('#failedImage').show();
                            $('#rejectedText').show();
                        } else if(finalResult != "APPROVED"){
                            $('#failedImage').show();
                            $('#failedText').show();
                        } else {
                            $('#successImage').show();
                            $('#successText').show();
                        }
                    }
                });
            }



        });
    </script>
    <!-- Adds IE root class without breaking doctype -->
    <!--[if IE]>
    <script>document.documentElement.className = document.documentElement.className + " ie";</script>
    <![endif]-->
</head>

<body class="theme--light">
<div class="site__root">
    <header class="site-header">
        <div class="site-header__inner site__wrap">
            <h1 class="visuallyhidden">Mobile&nbsp;Connect</h1>
            <a href="#"><img src="mcx-user-registration/mcresources/img/svg/mobile-connect.svg" alt="Mobile Connect&nbsp;Logo" width="150"
                             class="site-header__logo"></a>


        </div>
    </header>

    <main class="site__main site__wrap section v-distribute">
        <header class="page__header">
            <h1 class="page__heading">
               <fmt:message key='sms-label-authenticator'/>
            </h1>
            <p id="failedText" style="display:none;">
               <fmt:message key='sms-label-authenticator-fail'/>
            </p>
            <p id="successText" style="display: none">
               <fmt:message key='sms-label-authenticator-success'/>
            </p>
            <p id="rejectedText" style="display:none">
               <fmt:message key='sms-label-authenticator-rejected'/>
            </p>
        </header>

        <div class="page__illustration v-grow v-align-content">
            <div id="successImage" style="display: none">
                <img src="mcx-user-registration/mcresources/img/svg/successful-action.svg" alt="Reset successful" width="126" height="126">
            </div>
            <div id="failedImage" style="display: none">
                <img src="mcx-user-registration/mcresources/img/svg/failed.svg" alt="Reset successful" width="126" height="126">
            </div>
        </div>
    </main>
</div>
</body>
</html>













