<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Store</title>
    <link type="text/css" href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

    <style type="text/css">

      #backButton{float:right;}

    </style>

    <script type="text/javascript">
      $(document).ready(function(){
        $.ajax({
          url: "/user/getUserInfo",
          success: function(data){
            $("#userInfo").text(data);
          },
          error: function(data, status, er){
             $("#userInfo").text(data + " status: " + status + " er:" + er);
          }
        });
      });
    </script>

    <script>  
        function deleteItem(id){
          $.ajax({
            type: "DELETE",
            url: "/user/" + id,  
              success: function(data){
                $("#res1").text(data);
                window.location.reload(true);
              }
          });
        }  
 
    </script>  

</head>

<body>
    <div class="container">
    <div class="row">
        <div class="col-md-12">
  <!--
        <security:authentication property="principal.username" /><br>
  -->
        <div id="backButton"><a href="/"><img src="/resources/icon/back-1.jpg" width="100" height="50" alt="back"></a></div>
        <div id="userInfo"></div>
        <dic id="res1"></div>

        <div class="table-responsive">
            <table id="mytable" class="table table-bordred table-striped">
                <thead>
                   <tr>
                    <th>Product</th>
                    <th>Description</th>
                    <th>Count</th>
                    <th>Price</th>
                    <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.product}</td>
                            <td>${item.description}</td>
                            <td>${item.count}</td>
                            <td>${item.price}</td>
                            <td><p><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete1" data-placement="top" rel="tooltip" onclick="deleteItem(${item.id})"><span class="glyphicon glyphicon-trash"></span></button></p></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="clearfix"></div>
            
            <ul class="pagination pull-right">
              <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </ul>
                
            </div>
            
        </div>
    </div>
</div>

 
    
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
      <div class="modal-body">
        <div class="alert alert-warning"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
      </div>
      <div class="modal-footer ">
        <button type="button" class="btn btn-warning" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-warning" ><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
</div>

</body>
</html>
