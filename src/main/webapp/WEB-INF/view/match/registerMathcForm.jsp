<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <script>
	var date;
   	var hour;
   	var footballField;
   	
        $(function(){
            var registerMatchTable = $( "#registerMatchTable > tbody > tr");
            
           	registerMatchTable.filter(":even").addClass("tableEven");
           	registerMatchTable.filter(":odd").addClass("tableOdd");

           	
           	registerMatchTable.click(function(){
               		registerMatchTable.not(this)
               						  .find("input[type=checkbox]")
               						  .removeAttr("checked");
               	});

           
        })
    </script>
<div class="row">
    <div class = "col-lg-12 col-md-12 col-sm-12 col-xs-12">

        <h1> Choice a day </h1>

        <form name="searchAvaibleMatch" method="post" action="searchAvaibleMatch">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <input name="date" type="text" class="form-control datePickerMarker"/>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <select class="form-control" name="selectedHour">
                        <option> ---------- </option>
                        <c:forEach items="${hours}" var = "hour">
                            <option>
                                    ${hour}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <button class="btn btn-default" type="submit">Search</button>
                </div>
            </div>
            </form>
    </div>
</div>

<div class="row">
    <div class = "col-lg-6 col-md-6 col-sm-6 col-xs-6">
        <form name="registerMatch">
                <c:if test="${avaibleFootBallFields != null}">
                    <table class="table" id="registerMatchTable">
                        <thead>
                            <th>Date</th>
                            <th>Hour</th>
                            <th>FootBall Field</th>
                            <th>Choice</th>
                        </thead>

                        <tbody>
                        <c:forEach items="${avaibleFootBallFields}" var = "avaibleFootBallField">
                            <tr>
                                <td>${dateRequest}</td>
                                <td>${hourRequest}</td>
                                <td>${avaibleFootBallField}</td>
                                <td><input type="checkbox"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </c:if>


                <table class="table">
                    <thead>
                        <th>Team name</th>
                        <th>Select</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${squadreByReferente}" var="squadra">
                        <tr>
                            <td>${squadra.nome}</td>
                            <td onclick="prenotaPartita('${squadra.nome}')">join</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
    </div>
</div>