<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
 <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />

<div class="page-title">
    <h1>Change Password</h1>
</div>

        <div class="pager">
<dsp:form>
<table>
<tr><td>
Old Password:</td>
    <td><dsp:input bean="ProfileFormHandler.value.oldpassword" maxsize="35" size="35"
type="password"/></td></tr>
<tr><td>
New Password:</td>
<td><dsp:input bean="ProfileFormHandler.value.password" maxsize="35" size="35" value=""
type="password"/></td></tr>
<tr><td>
Confirm Password:</td>
<td><dsp:input bean="ProfileFormHandler.value.confirmpassword" maxsize="35" size="35"
type="password"/></td></tr>
</table>
<dsp:input bean="ProfileFormHandler.changePasswordSuccessURL" type="hidden" value="/" /><br><br>
<center><dsp:input bean="ProfileFormHandler.changePassword" type="submit" class="input-submit" value="Save New Password"/>
       </center>
</dsp:form>    
    
        </div>


</dsp:page>