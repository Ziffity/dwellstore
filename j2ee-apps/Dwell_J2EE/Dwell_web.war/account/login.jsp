<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:include page="/includes/header.jsp" />
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
	<div class="main col1-layout">
		<div class="col-main">
			<dsp:form  method="post">
     
   <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
        <dsp:oparam name="output">
        <b><dsp:valueof param="message"/></b><br>
        </dsp:oparam>
        <dsp:oparam name="outputStart">
        <LI>
        </dsp:oparam>
        <dsp:oparam name="outputEnd">
        </LI>
        </dsp:oparam>
        </dsp:droplet>
			<div class="row">
				<div class="col-sm-6 new-users">
					<div class="content">
						<h2>New Customers</h2>
						<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
					</div>
					<div class="buttons-set">
						<button class="button" onclick="window.location='/account/register.jsp';" title="Create an Account" type="button">
							<span>
								<span>Create an Account</span>
							</span>
						</button>
					</div>
				</div>
				<div class="col-sm-6 registered-users">
					<div class="content">
						<h2>Registered Customers</h2>
						<p>If you have an account with us, please log in.</p><br>
						<ul class="form-list">
							<li>
								<label class="required" for="email"><em>*</em>Email Address</label>
								<div class="input-box">
									<dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.login" name="login" size="24" type="text"/>
								</div>
							</li>
							<li>
								<label class="required" for="password"><em>*</em>Password</label>
								<div class="input-box">
									<dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.password" name="password" size="24" type="password"/><br>
            						<dsp:input bean="/atg/userprofiling/ProfileFormHandler.loginSuccessURL" type="hidden" value="/"/>
								</div>
							</li>
						</ul>
					</div>
					<div class="col-sm-6" class="buttons-set">
						<a class="f-left" href="/account/forgotpassword.jsp">Forgot Your Password?</a>
						<br><dsp:input bean="/atg/userprofiling/ProfileFormHandler.login" class="input-submit" type="Submit" value="Login"/>
					</div>
				</div>
			</div>
 </dsp:form>
 </div>
 </div>
 </div>
 <dsp:include page="/includes/footerNew.jsp" />
 </div>
 </body>
 </dsp:page>