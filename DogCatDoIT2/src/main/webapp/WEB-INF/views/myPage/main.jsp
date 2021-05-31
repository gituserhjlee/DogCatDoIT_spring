<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='resources/fullcalendar/lib/main.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
    <style type="text/css">
    	#calendar{
    		width: 50%;
    	}
    </style>
  </head>
  <body>
  	<div>
  		<h4>출석체크</h4>
  	</div>
    <div id='calendar'></div>
  </body>
</html>