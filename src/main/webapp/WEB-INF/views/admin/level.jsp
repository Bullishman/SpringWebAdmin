<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="spreadjs culture" content="ko-kr" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="http://cdn.grapecity.com/spreadjs/hosted/css/gc.spread.sheets.excel2013white.12.0.4.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="http://cdn.grapecity.com/spreadjs/hosted/scripts/gc.spread.sheets.all.12.0.4.min.js" type="text/javascript"></script>
    <script src="http://cdn.grapecity.com/spreadjs/hosted/scripts/resources/ko/gc.spread.sheets.resources.ko.12.0.4.min.js" type="text/javascript"></script>

    <style>*{-webkit-tap-highlight-color: rgba(0,0,0,0);}

.sample-tutorial {
     position: relative;
     height: 100%;
     overflow: hidden;
}

.sample-spreadsheets {
    width: calc(1000px);
    height: 1000px;
    overflow: hidden;
    float: left;
}

.options-container {
    float: right;
    width: 280px;
    padding: 12px;
    height: 100%;
    box-sizing: border-box;
    background: #fbfbfb;
    overflow: auto;
}

.option-row {
    font-size: 14px;
    padding: 5px;
    margin-top: 10px;
}

label {
    display: block;
    margin-bottom: 6px;
    margin-top: 6px;
}

input {
    padding: 4px 6px;
}

input[type=button] {
    margin-top: 6px;
    display: block;
}
</style>
   
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>

var dataList = [];
/* var size = ${fn:length("count")}; */
console.log(${map.list.size()});
/* console.log(${map.list}); */

/*     window.onload = function() {
        var spread = new GC.Spread.Sheets.Workbook(document.getElementById("ss"));
        initSpread(spread);
    };

    function check() {
    	<c:forEach var="row" items="${map.list}">
    		<c:set var="userid" value="${row.userid}" />
    		var chkb${userid} = '${userid}';
    	</c:forEach>
    	
    	for(var i = 2; i <= 4; i++) {
    		
    		if(i == chkb2) {
    			$("input:checkbox[id='chkb" + i + "']").prop("checked", true);
    		}
    		if(i == chkb3) {
    			$("input:checkbox[id='chkb" + i + "']").prop("checked", true);
    		}
    		if(i == chkb4) {
    			$("input:checkbox[id='chkb" + i + "']").prop("checked", true);
    		}
    	}

    	var size = ${fn:length("map.list")};
    	alert(size + 3);
    }

 */
 
    var _lines = ["Computers", "Washers", "Stoves"];
    var _colors = ["Red", "Green", "Blue", "White"];
    var _ratings = ["Terrible", "Bad", "Average", "Good", "Great", "Epic"];

/*     window.onload = function() {
        var spread = new GC.Spread.Sheets.Workbook(document.getElementById("ss"), {
            sheetCount: 2
        });
        initSpread(spread);
    };
 */

	window.onload = function () {
	    var spread = new GC.Spread.Sheets.Workbook(_getElementById("ss"), { sheetCount: 3 });
	    initSpread(spread);
	};

    function Product(id, line, color, name, price, cost, weight, discontinued, rating) {
        this.id = id;
        this.line = line;
        this.color = color;
        this.name = name;
        this.price = price;
        this.cost = cost;
        this.weight = weight;
        this.discontinued = discontinued;
        this.rating = rating;
    }

    function getProducts2(count) {
        var dataList = [];
        for (var i = 1; i <= count; i++) {
        	
            var line = _lines[parseInt(Math.random() * 3)];
            
            dataList[i - 1] = new Product(
            	i,
                line,
                _colors[parseInt(Math.random() * 4)],
                line + " " + line.charAt(0) + i,
                
                parseInt(Math.random() * 5001) / 10.0 + 500,
                parseInt(Math.random() * 6001) / 10.0,
                parseInt(Math.random() * 10001) / 100.0,
                !!(Math.random() > 0.5),
                _ratings[parseInt(Math.random() * 6)]);
        }
        return dataList;
    }
    

     function getProducts(count) {

        /* var dataList = []; */
        /* for (var i = 1; i <= count; i++) {
        	
            var line = _lines[parseInt(Math.random() * 3)];
            
            dataList[i - 1] = new Product(
            	i,
                line,
                _colors[parseInt(Math.random() * 4)],
                line + " " + line.charAt(0) + i,
                
                parseInt(Math.random() * 5001) / 10.0 + 500,
                parseInt(Math.random() * 6001) / 10.0,
                parseInt(Math.random() * 10001) / 100.0,
                !!(Math.random() > 0.5),
                _ratings[parseInt(Math.random() * 6)]);
        } */

        var board = [];
        var id = "";
        <c:forEach var="row" items="${map.list}" varStatus="status">
        	<c:set var="id" value="${row.userid}" />
        	/* id = ${row.userid}; */
        	console.log("${row.userid}");
        	console.log(${status.count});
        	dataList["${status.count}"-1] = new Product(
        			"${row.userid}",
        			"${row.name}",
        			"${row.email}",
        			"${row.authority}",
        			"${row.rply}",
        			"${row.board}",
        			"${row.joinDate}",
        			"${row.joinDate}",
        			"${row.joinDate}");
 		</c:forEach>

        return dataList;

    }

    function initSpread(spread) {
        spread.suspendPaint();
        spread.options.tabStripRatio = 0.8;

        var products = getProducts(${map.list.size()});
        /* var products = getProducts(100); */

        var spreadNS = GC.Spread.Sheets;
        var sheet = spread.getSheet(0);
        sheet.name("Default binding");
        sheet.setDataSource(products);

        var sheet2 = spread.getSheet(1);
        sheet2.name("Custom binding");
        sheet2.autoGenerateColumns = false;
        sheet2.setDataSource(products);
        
        var colInfos = [{
                name: "id",
                displayName: "ID"
            },
            {
                name: "name",
                displayName: "Name",
                size: 100
            },
            {
                name: "line",
                displayName: "Line",
                size: 80
            },
            {
                name: "color",
                displayName: "Color"
            },
            {
                name: "price",
                displayName: "Price",
                formatter: "0.00",
                size: 80
            },
            {
                name: "cost",
                displayName: "Cost",
                formatter: "0.00",
                size: 80
            },
            {
                name: "weight",
                displayName: "Weight",
                formatter: "0.00",
                size: 80
            },
            {
                name: "discontinued",
                displayName: "Discontinued",
                cellType: new GC.Spread.Sheets.CellTypes.CheckBox(),
                size: 100
            },
            {
                name: "rating",
                displayName: "Rating"
            }
        ];
        sheet2.bindColumns(colInfos);

        
        spread.bind(spreadNS.Events.ActiveSheetChanged, function (e, args) {
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.ActiveSheetChanged + ' event called' + '\n' +
                'oldSheetName: ' + args.oldSheet.name() + '\n' +
                'newSheetName: ' + args.newSheet.name();
        });
        
        spread.bind(spreadNS.Events.CellClick, function (e, args) {
            var sheetArea = args.sheetArea === 0 ? 'sheetCorner' : args.sheetArea === 1 ? 'columnHeader' : args.sheetArea === 2 ? 'rowHeader' : 'viewPort';
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.CellClick + ' event called' + '\n' +
                'sheetArea: ' + sheetArea + '\n' +
                'row: ' + args.row + '\n' +
                'col: ' + args.col + '\n' +
                'values: ' + args.getValue;
        });
        
        spread.bind(spreadNS.Events.SelectionChanging, function (e, args) {
            var selection = args.newSelections.pop();
            var sheetArea = args.sheetArea === 0 ? 'sheetCorner' : args.sheetArea === 1 ? 'columnHeader' : args.sheetArea === 2 ? 'rowHeader' : 'viewPort';
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.SelectionChanging + ' event called' + '\n' +
                'sheetArea: ' + sheetArea + '\n' +
                'row: ' + selection.row + '\n' +
                'column: ' + selection.col + '\n' +
                'rowCount: ' + selection.rowCount + '\n' +
                'colCount: ' + selection.colCount;
        });
        
        spread.bind(spreadNS.Events.SelectionChanged, function (e, args) {
            var selection = args.newSelections.pop();
            if(selection.rowCount > 1 && selection.colCount > 1){      
            var sheetArea = args.sheetArea === 0 ? 'sheetCorner' : args.sheetArea === 1 ? 'columnHeader' : args.sheetArea === 2 ? 'rowHeader' : 'viewPort';
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.SelectionChanged + ' event called' + '\n' +
                'sheetArea: ' + sheetArea + '\n' +
                'row: ' + selection.row + '\n' +
                'column: ' + selection.col + '\n' +
                'rowCount: ' + selection.rowCount + '\n' +
                'colCount: ' + selection.colCount;
        }});
        
        spread.bind(spreadNS.Events.EditStarting, function (e, args) {
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.EditStarting + ' event called' + '\n' +
                'row: ' + args.row + '\n' +
                'column: ' + args.col;
        });
        
        spread.bind(spreadNS.Events.EditEnded, function (e, args) {
            _getElementById("showSpreadEvents").value=
                'SpreadEvent: ' + GC.Spread.Sheets.Events.EditEnded + ' event called' + '\n' +
                'row: ' + args.row + '\n' +
                'column: ' + args.col + '\n' +
                'text: ' + args.editingText;
        });

        spread.resumePaint();
    };

    function _getElementById(id){
        return document.getElementById(id);
    }

    $(document).ready(function () {
	    $("#dataCheck").click(function() {
	    	console.log(dataList);
	    	
	    	$.ajax({
	    	    type: 'post',
	    	    url: "${path}/admin/excelInsert.do",
	    	    data: dataList,
	    	    success: function(data){
	    	      // success
	    	    	dataList
	    	    }    
	    	})
	    	
	    });
    });
    
</script>
</head>
<body>
	<%@ include file="../include/menuAdmin.jsp"%>
	<h2>등급관리</h2>

	<!-- 검색폼 -->
	<%-- <form name="form1" method="post" action="${path}/admin/level.do">
		<select name="search_option">
			<option value="userid"
				<c:if test="${map.search_option == 'userid'}">selected</c:if>>아이디</option>
			<option value="email"
				<c:if test="${map.search_option == 'email'}">selected</c:if>>이메일</option>
			<option value="all"
				<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
	</form> --%>

	<%-- ${map.count}개의 게시물이 있습니다.
	<table border="1" width="1000px" align="center">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>활동 내역</th>
			<th>등급</th>
			<th>가입일</th>
			<th>등업</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.userid}</td>
				<td>${row.name}</td>
				<td>${row.email}</td>
				<td>게시글 수 : ${row.board} 댓글 수 : ${row.rply}</td>
				<td id="${row.userid}">${row.authority}</td>
				<td><fmt:formatDate value="${row.joinDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><select name="authority" id="authority">
						<option value="ROLE_BABY">준회원</option>
						<option value="ROLE_MEMBER">정회원</option>
						<option value="ROLE_MANAGER">매니저</option>
				</select>
					<button type="button" class="change">변경하기</button></td>
				
			</tr>
		</c:forEach>

		<!-- 페이지 네비게이션 -->
		<tr>
			<td colspan="8" align="center"><c:if
					test="${map.pager.curBlock > 1 }">
					<a href="javascript:list('1')">[처음]</a>
				</c:if> <c:if test="${map.pager.curBlock > 1 }">
					<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
				</c:if> <c:forEach var="num" begin="${map.pager.blockBegin}"
					end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage }">
							<span style="color: red;">${num}</span>&nbsp;
				</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
				</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
				</c:if> <c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
				</c:if></td>
		</tr>

	</table> --%>
	
	
	<div class="sample-tutorial">
        	<input type="button" id="dataCheck" value="데이터">
        	
        <div id="ss" class="sample-spreadsheets">
        </div>
        
	    <div class="options-container">
	        <div class="option-row">
	            <label>Click the sheet tab to change the active sheet. Click the cell or select range to edit.</label>
	        </div>
	        <div class="option-row">
	            <textarea id="showSpreadEvents" cols="40" rows="8" style="width: 90%"></textarea>
	        </div>
	    </div>
    </div>
</body>
</html>



















