<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        /***
Bootstrap Line Tabs by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
***/

/* Tabs panel */
.tabbable-panel {
  border:1px solid #eee;
  padding: 10px;
}

/* Default mode */
.tabbable-line > .nav-tabs {
  border: none;
  margin: 0px;
}
.tabbable-line > .nav-tabs > li {
  margin-right: 2px;
}
.tabbable-line > .nav-tabs > li > a {
  border: 0;
  margin-right: 0;
  color: #737373;
}
.tabbable-line > .nav-tabs > li > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open, .tabbable-line > .nav-tabs > li:hover {
  border-bottom: 4px solid #fbcdcf;
}
.tabbable-line > .nav-tabs > li.open > a, .tabbable-line > .nav-tabs > li:hover > a {
  border: 0;
  background: none !important;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.open > a > i, .tabbable-line > .nav-tabs > li:hover > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open .dropdown-menu, .tabbable-line > .nav-tabs > li:hover .dropdown-menu {
  margin-top: 0px;
}
.tabbable-line > .nav-tabs > li.active {
  border-bottom: 4px solid #f3565d;
  position: relative;
}
.tabbable-line > .nav-tabs > li.active > a {
  border: 0;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.active > a > i {
  color: #404040;
}
.tabbable-line > .tab-content {
  margin-top: -3px;
  background-color: #fff;
  border: 0;
  border-top: 1px solid #eee;
  padding: 15px 0;
}
.portlet .tabbable-line > .tab-content {
  padding-bottom: 0;
}

/* Below tabs mode */

.tabbable-line.tabs-below > .nav-tabs > li {
  border-top: 4px solid transparent;
}
.tabbable-line.tabs-below > .nav-tabs > li > a {
  margin-top: 0;
}
.tabbable-line.tabs-below > .nav-tabs > li:hover {
  border-bottom: 0;
  border-top: 4px solid #fbcdcf;
}
.tabbable-line.tabs-below > .nav-tabs > li.active {
  margin-bottom: -2px;
  border-bottom: 0;
  border-top: 4px solid #f3565d;
}
.tabbable-line.tabs-below > .tab-content {
  margin-top: -10px;
  border-top: 0;
  border-bottom: 1px solid #eee;
  padding-bottom: 15px;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!--
     <script type="text/javascript">
        function doAjax() {
            $.ajax({
                type: "GET",
                url: "admin/getitem",
                contentType: "application/json",
                data: JSON.stringify({ firstName: $("#first_name").val(), lastName: $("#last_name").val(), age: $("#age").val(), email: $("#email").val(), password: $("#password").val() }),
                success :function(result) {
                    // do what ever you want with data
                }
            });
        }
    </script>
-->

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
    		

			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">
							Список пользователей </a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab">
							Accrued PTO Conversion </a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							Override RTO </a>
						</li>
                        <li>
    						<a href="#tab_default_4" data-toggle="tab">
							Non-Standard Rates </a>
						</li>
                        <li>
    						<a href="#tab_default_5" data-toggle="tab">
							Anniversary Timeoffs </a>
						</li>

					</ul>

					<div class="tab-content">

						<div class="tab-pane active" id="tab_default_1">
							
                            <ul class="table table-striped" style="width:100%">
                               
                                <div class="col-xs-2">
                                    Имя
                                </div>        
                                <div class="col-xs-2">
                                    Фамилия
                                </div>
                                <div class="col-xs-2">
                                    Возраст
                                </div>
                                <div class="col-xs-2">
                                    Email
                                </div>
                                <div class="col-xs-2">
                                    Кол-во товара
                                </div>
                                <div class="col-xs-2">
                                    Права
                                </div>
                                <br>        
                  
                            </ul>

                       
                           
                                <ul class="table table-striped" style="width:100%">
                                <c:forEach items="${list}" var="user">

                                   <div class="row toggle" id="dropdown-detail-${user.id}" data-toggle="detail-${user.id}">
                                        <div class="col-xs-2">
                                            ${user.firstName}
                                        </div>
                                        <div class="col-xs-2">
                                            ${user.lastName}
                                        </div>
                                        <div class="col-xs-2">
                                            ${user.age}
                                        </div>
                                        <div class="col-xs-2">
                                            ${user.email}
                                        </div>
                                        <div class="col-xs-2">
                                            ${fn:length(user.items)}
                                        </div>
                                        <div class="col-xs-2">
                                            <select>
                                                <option value="1" ${user.usersProfile.type == 'ADMIN' ? 'selected="selected"' : ''}>ADMIN</option>
                                                <option value="2" ${user.usersProfile.type == 'USER' ? 'selected="selected"' : ''}>USER</option>
                                                <option value="2" ${user.usersProfile.type == 'PRO-USER' ? 'selected="selected"' : ''}>PRO-USER</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div id="detail-${user.id}">
                                        
                                        <div class="container">
                                            <c:forEach items="${user.items}" var="item">
                                                ${item.product}<p>
                                            </c:forEach>
                                        </div>

                                    </div>
                                            
                                   
                                </c:forEach>
                                </ul>
                           
                        
                    </div>


						<div class="tab-pane" id="tab_default_2">
							<form>
                            <table class="table table-striped" style="width:100%">
                                <tr>
                                    <td style="width:40%">
                                        <table align="center" class="table table-bordered">
                                            <tr>
                                                <td>Year</td>
                                                <td><input id="year" name="year" type="text" placeholder="2015" class="form-control input-medium" required=""></td>
                                            </tr>
                                            <tr>
                                                <td>Days</td>
                                                <td><input id="days" name="days" type="text" placeholder="5" class="form-control input-medium" required=""></td>
                                            </tr>
                                            <tr>
                                                <td>Initials</td>
                                                <td><input id="initials" name="initials" type="text" placeholder="chay" class="form-control input-medium" required=""></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align:center"><button id="" name="" class="form-control btn btn-primary">Insert Anniversary Timeoff</button></td>
                                            </tr>
											<tr>
												<td><input id="filebutton" name="filebutton" class="form-control input-file" type="file"></td>
												<td><input type="submit" value="Upload" class="form-control btn btn-primary"/></td>
											</tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table class="table table-bordered">
                                            <tr>
                                                <td>Year</td>
                                                <td>Days</td>
                                                <td>User</td>
                                            </tr>
                                            <tr>
                                                <td>2015</td>
                                                <td>5</td>
                                                <td>LEAT</td>
                                            </tr>
                                            <tr>
                                                <td>2015</td>
                                                <td>3</td>
                                                <td>KKX</td>
                                            </tr>
                                            <tr>
                                                <td>2016</td>
                                                <td>3</td>
                                                <td>RP</td>
                                            </tr>
                                            <tr>
                                                <td>2016</td>
                                                <td>1</td>
                                                <td>RPU</td>
                                            </tr>
											<tr>
                                                <td>2016</td>
                                                <td>1</td>
                                                <td>TNO</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width:40%">
                                        <p style="text-align:justify">View and/or Enter “Accrued PTO conversion” data for employees: 
This data is entered for an employee for a specific year. This transaction must 
capture comments, who entered the data, and when the data was entered. </p>
                                    </td>
                                </tr>
                            </table>
                            
                        </form>
						</div>
						<div class="tab-pane" id="tab_default_3">
							<form>
                            <table class="table table-striped" style="width:100%">
                                <tr>
                                    <td style="width:40%">
                                        <table align="center" class="table table-bordered">
                                            <tr>
                                                <td>Year</td>
                                                <td><input id="year" name="year" type="text" placeholder="2015" class="form-control input-medium" required=""></td>
                                            </tr>
                                            <tr>
                                                <td>Days</td>
                                                <td><input id="days" name="days" type="text" placeholder="5" class="form-control input-medium" required=""></td>
                                            </tr>
											<tr>
												<td>Initials</td>
                                                <td><input id="initials1" name="initials1" type="text" placeholder="chay" class="form-control input-medium" required=""></td>
											</tr>
                                            <tr>
                                                <td>RTO Type</td>
                                                <td>
                                                    <select id="shiftType" name="shiftType" class="form-control input-medium">
                                                        <option>Regular</option>
                                                        <option>Anniversary</option>
														<option>Floating</option>
														<option>Accrued</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align:center"><button id="" name="" class="form-control btn btn-primary">Override RTO</button></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td colspan="2" >
                                        <p style="text-align:justify">This override feature will be used in rare cases when algorithm doesn’t compute the 
RTO numbers correctly. Use of this feature is considered a defect, but this capability 
will ensure that until algorithm is fixed, employee is not seeing incorrect RTO 
balance.</p>
                                    </td>
                                </tr>
                            </table>
                            
                        </form>
						</div>
						<div class="tab-pane" id="tab_default_4">
							<form>
							<table class="table table-striped" style="width:100%">
								<tr>
								<td style="width:30%">
									<table align="center" class="table table-bordered">
										<tr>
											<td>Initials</td>
											<td><input type="text" name="initials" placeholder="initials" class="form-control input-medium"/></td>
										</tr>
										<tr>
											<td>Rate (Per Year)</td>
											<td><input type="text" name="initials" placeholder="rate" class="form-control input-medium"/></td>
										</tr>
										<tr><td style="align:center" colspan="2"><input type="button" value="Add Non-Standard Rate" class="form-control btn btn-primary"/></td></tr>
									</table>
								</td>
								<td>
									<table align="center" class="table table-bordered">
										<tr><td>Initials</td><td>Rate</td><td>Select</td></tr>
										<tr><td>CHAY</td><td>14</td><td><input type="checkbox" name="removenonstandard"/></td></tr>
										<tr><td>LEAT</td><td>15</td><td><input type="checkbox" name="removenonstandard"/></td></tr>
										<tr><td>RSTE</td><td>16</td><td><input type="checkbox" name="removenonstandard"/></td></tr>
										<tr><td colspan="3" style="text-align:center"><input type="button" value="Remove Rate" class="form-control btn btn-primary"/></td></tr>
									</table>
								</td>
								<td style="width:40%">
									<p style="text-align:justify">Some employees may negotiate better RTO days than the standard policy in their 
offer letters. For such employees, this screen will capture their non standard annual 
RTO days/year. During the annual RTO computation, system will compute RTO days 
using both standard rate and non-standard rate, and use the better of the two as the 
annual RTO for the year.</p>
								</td>
								</tr>
							</table>
							</form>
						</div>
						<div class="tab-pane" id="tab_default_5">
							<form>
							<table class="table table-striped" style="width:100%">
								<tr>
								<td style="width:50%">
									<table align="center" class="table table-bordered">
										<tr><td>Initials</td><td>Service (Yrs.)</td><td>Days</td><td>Select</td></tr>
										<tr><td>RPU</td><td>10</td><td>12</td><td><input name="approve" type="checkbox" class="input-small"/></td></tr>
										<tr><td>CTW</td><td>12</td><td>14</td><td><input name="approve" type="checkbox" class="input-small"/></td></tr>
										<tr><td>GRV</td><td>10</td><td>12</td><td><input name="approve" type="checkbox" class="input-small"/></td></tr>
										<tr><td>KKX</td><td>10</td><td>12</td><td><input name="approve" type="checkbox" class="input-small"/></td></tr>
										<tr><td>LEAT</td><td>4</td><td>3</td><td><input name="approve" type="checkbox" class="input-small"/></td></tr>
										<tr><td colspan="4" style="text-align:center"><input type="button" class="form-control btn btn-primary" value="Approve & Release Selected"/></td></tr>
									</table>
								</td>
								<td>
								<p style="text-align:justify">This approval step is added to ensure that the anniversary time offs become 
available to employee at the right time to coincide with the declaration of the 
service awards.</p>
								</td>
								</tr>
							</table>
							</form>
						</div>
						<div class="tab-pane" id="tab_default_6">
							<form>
							<table class="table table-striped" style="width:100%">
								<tr>
									<td style="width:40%">
										<table align="center" class="table table-bordered">
											<tr>
												<td>Year</td>
												<td><input type="text" name="year" class="form-control input-medium"/></td>
											</tr>
											<tr>
												<td>Days</td>
												<td><input type="text" name="days" class="form-control input-medium"/></td>
											</tr>
											<tr>
												<td colspan="2"><input type="submit" name="Add Shutdown" class="btn btn-primary form-control"/></td>
											</tr>
											<tr>
												<td colspan="2">*Note: Adding shutdown for existing year will override the old value</td>
											</tr>
										</table>
									</td>
									<td>
										<table align="center" class="table table-bordered">
											<tr><td>Year</td><td>Shutdown Days</td></tr>
											<tr><td>2014</td><td>2</td></tr>
											<tr><td>2015</td><td>4</td></tr>
											<tr><td>2016</td><td>0</td></tr>
											<tr><td>2017</td><td>0</td></tr>
											<tr><td>2018</td><td>0</td></tr>
										</table>
									</td>
									<td style="width:30%">
										<table align="center" class="table table-bordered">
											<tr>
												<td>Year</td>
												<td><input type="text" name="year" class="form-control input-medium" placeholder="2014"/></td>
											</tr>
											<tr>
												<td>Days</td>
												<td><input type="text" name="year" class="form-control input-medium" placeholder="3"/></td>
											</tr>
											<tr>
												<td>Initials</td>
												<td><input type="text" name="year" class="form-control input-medium" placeholder="initials1,initials2,.."/></td>
											</tr>
											<tr>
												<td colspan="2"><input type="button" class="form-control btn btn-primary" value="Override Shutdown"</td>
											</tr>
											<tr>
												<td><input type="file" name="file" class="form-control input-medium"/></td>
												<td><input type="button" class="form-control btn btn-primary" value="Upload" />
											</tr>
										</table>
									</td>
								</tr>
							</table>
							</form>
						</div>
						<div class="tab-pane" id="tab_default_7">
							<form>
                            <table class="table table-striped" style="width:100%">
                                <tr>
                                    <td style="width:40%">
                                        <table align="center" class="table table-bordered">
											<tr>
												<td>Initials</td>
                                                <td><input id="initials2" name="initials2" type="text" placeholder="user1,user2,.." class="form-control input-medium" required=""></td>
											</tr>
                                            <tr>
                                                <td colspan="2" style="text-align:center"><button id="" name="" class="form-control btn btn-primary">Add To List</button></td>
                                            </tr>
                                        </table>
                                    </td>
									<td>
										<table class="table table-striped" style="width:100%">
											<tr>
												<td><select multiple="multiple" name="removeOverride" class="form-control input-medium">
												<option value="initials1">Name1 - Initials1</option>
												<option value="initials2">Name2 - Initials2</option>
												<option value="initials3">Name3 - Initials3</option>
												<option value="initials4">Name4 - Initials4</option>
												<option value="initials5">Name5 - Initials5</option>
												</select></td>
											</tr>
											<tr>
                                                <td colspan="2" style="text-align:center"><button id="" name="" class="form-control btn btn-primary">Remove From List</button></td>
                                            </tr>
										</table>
									</td>
                                    <td>
                                        <p style="text-align:justify">This feature is requires to support non-US employees that may be in US payroll and 
may follow RTO. This list will be maintained by HR RTO Admin.</p>
                                    </td>
                                </tr>
                            </table>
                            
                        </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('[id^=detail-]').hide();
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
});


</script>


</body>
</html>