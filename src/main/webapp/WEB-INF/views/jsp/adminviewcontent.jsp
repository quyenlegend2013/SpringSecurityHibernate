<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Content Managementt</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6631cf4e8b.js"></script>
    <script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        // Code formatDate abcxyz
        function formatDate(date) {
            var yyyy = date.getFullYear();
            var dd = date.getDate();
            var mm = (date.getMonth() + 1);

            if (dd < 10)
                dd = "0" + dd;

            if (mm < 10)
                mm = "0" + mm;

            var current_day = dd + "/" + mm + "/" + yyyy;

            var hours = date.getHours()
            var minutes = date.getMinutes()
            var seconds = date.getSeconds();

            if (hours < 10)
                hours = "0" + hours;

            if (minutes < 10)
                minutes = "0" + minutes;

            if (seconds < 10)
                seconds = "0" + seconds;

            //return current_day + " " + hours + ":" + minutes;
            return current_day;
        }

        function loadData() {
            $
                .ajax({
                    url: "loadcontent",
                    dataType: 'json',
                    type: 'get',
                    cache: false,
                    success: function (data) {
                        /*console.log(data);*/
                        var event_data = '';

                        var id = 1;
                        $
                            .each(
                                data,
                                function (index, value) {
                                    var date = new Date(value.createDate);
                                    var formattedDate = formatDate(date);
                                    console.log(value);
                                    event_data += '<tbody>';
                                    event_data += '<tr>';
                                    event_data += '<td>' + id + '</td>';
                                    //event_data += '<td>' + value.authorid.authorid + '</td>';
                                    event_data += '<td>' + value.title+ '</td>';
                                    event_data += '<td>' + value.contents+ '</td>';
                                    event_data += '<td>' + formattedDate +  '</td>';
                                    event_data += '<td>' + value.updateTime+ '</td>';
                                    //event_data += '<td> <button type="button" class="btn btn-success" onclick="location.href=\'update?id='+value.contentID +'\'" '       +'>Edit</button></td>';
                                    event_data += '<td> <button type="button" class="btn btn-success" onclick="deleteContent(' + value.contentID + ');" '      +'>Delete</button></td>';
                                    event_data += '</tr>';
                                    event_data += '</tbody>';
                                    id++;
                                });
                        $("#list_table_json").append(event_data);
                    },
                    error: function (d) {
                        /*console.log("error");*/
                        alert("404. Please wait until the File is Loaded.");
                    }
                });
        };
    </script>

    <script>
        function deleteContent(id) {
            if (confirm("Do you want to delete this content?")) {
                $.ajax({
                    url: 'deletecontent/' + id,
                    method: 'GET',
                    success: function (data) {
                        $("#list_table_json > tbody").empty();
                        /*  alert("Deleted!"); */
                        loadData();
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            } else {
                //alert("Cancel");
            }
            ;

        }
    </script>
    <script>
        $(document).ready(function doSearch() {
            $('#searchbox').on("input", function () {
                $("#list_table_json > tbody").empty();
                var s = $('#searchbox').val();

                if (s==""){
                	$("#list_table_json > tbody").empty();
                    loadData();
                }else {
                    $.ajax({
                        url: "searchcontent/"+s,
                        dataType: 'json',
                        type: 'get',
                        cache: false,
                        success: function (data) {
                            /*console.log(data);*/
                            var event_data = '';

                            var id = 1;
                            $
                                .each(
                                    data,
                                    function (index, value) {
                                        var date = new Date(value.createDate);
                                        var formattedDate = formatDate(date);
                                        console.log(value);
                                        event_data += '<tbody>';
                                        event_data += '<tr>';
                                        event_data += '<td>' + id + '</td>';
                                        //event_data += '<td>' + value.authorid.authorid + '</td>';
                                        event_data += '<td>' + value.title+ '</td>';
                                        event_data += '<td>' + value.contents+ '</td>';
                                        event_data += '<td>' + formattedDate +  '</td>';
                                        event_data += '<td>' + value.updateTime+ '</td>';
                                        //event_data += '<td> <button type="button" class="btn btn-success" onclick="location.href=\'update?id='+value.contentID +'\'" '       +'>Edit</button></td>';
                                        event_data += '<td> <button type="button" class="btn btn-success" onclick="deleteContent(' + value.contentID + ');" '      +'>Delete</button></td>';
                                        event_data += '</tr>';
                                        event_data += '</tbody>';
                                        id++;
                                    });
                            $("#list_table_json").append(event_data);
                        },
                        error: function (d) {
                            /*console.log("error");*/
                            alert("404. Please wait until the File is Loaded.");
                        }
                    })
                }})
        });
    </script>

</head>
<body onload="loadData();">
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light border">
        <div class="col-11 bg-light text-secondary">CMS</div>
        <div class="col-1 bg-light text-right">
            <div class="btn-group">
                <button type="button" class="btn btn-light dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                        style="color: blue;">
                    <i class="fas fa-user"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <button class="dropdown-item" type="button"
                            onclick="location.href='editProfile?id=<c:out value="${userid}"></c:out>'">
                        <i class="fas fa-user p-2"></i>User Profile
                    </button>
                    <button class="dropdown-item" type="button"
                            onclick="location.href='logout'">
                        <i class="fas fa-sign-out-alt p-2"></i>Logout
                    </button>
                </div>
            </div>
        </div>
    </nav>
</header>
<main>
    <div class="container-fluid flex-xl-nowrap">
        <div class="row">
            <div class="col-3 bg-light border border-top-0 border-bottom-0 "style="height: 693px;">
                <div class="row border border-top-0 border-right-0">
                    <div class="input-group p-2">
                        <input type="text" class="form-control" placeholder="Search..." id="searchbox">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" onclick="doSearch();">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col p-2 border border-top-0 border-right-0"style="background-color: #eceff1;">
                        <a href="adminviewcontent"><i class="fas fa-table"> Content Management</i></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col p-2 border border-top-0 border-right-0">
                        <a href="adminviewmember"><i class="fas fa-edit"> Member Management</i></a>
                    </div>
                </div>
            </div>
            <div class="col-9">
                <nav class="navbar navbar-expand-lg navbar-light border-bottom">
                    <h2>Content Management</h2>
                </nav>
                <div class="row p-4">
                    <div class="col border border-bottom-0">
                        <div
                                class="row bg-light p-2 border border-top-0 border-left-0 ">View Content
                        </div>
                    </div>
                    <table class="table table-hover table-bordered table-responsive" id="list_table_json">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Created Date</th>
                            <th>Updated Time</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                    </table>
                </div>

            </div>
        </div>
    </div>
</main>
</body>
</html>