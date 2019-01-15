<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>CRAWING을 이용한 SCREEN</title>
<style type="text/css">
.pls, table.team, div#dashboard {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
div#tMian{
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
path {
	stroke: #fff;
}

path:hover {
	opacity: 0.9;
}

rect:hover {
	fill: orange;
}

.axis {
	font: 10px sans-serif;
}

.legend tr {
	border-bottom: 1px solid grey;
}

.legend tr:first-child {
	border-top: 1px solid grey;
}

.axis path, .axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}

.x.axis path {
	display: none;
}

.legend {
	margin-bottom: 76px;
	display: inline-block;
	border-collapse: collapse;
	border-spacing: 0px;
}

.legend td {
	padding: 4px 5px;
	vertical-align: bottom;
}

.legendFreq, .legendPerc {
	align: right;
	width: 50px;
}

table {
	border-collapse: collapse;
}

table.legend {
	padding: 0px 0px 100px 0px;
}

.pies {
	padding-left: 50px;
}

th {
	border-top: 3px solid;
	border-bottom: 3px solid;
}

td.ts {
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

.pls:hover {
	background-color: #e5e5e5;
}

.teamC:hover {
	background-color: #cccccc;
}

div.w3-row {
	width: 1060px;
	margin: auto;
}
</style>
<script type="text/javascript">
	function player_disp(id) {
		var disp = document.getElementById(id);
		if (disp.style.display == 'block') {
			disp.style.display = "none";
		} else {
			disp.style.display = "block";
		}
	}
</script>
</head>
<body>
<hr style="border-top : 1px solid gray;">
	<div id="tMian">
	<h1>팀 순위</h1>
	</div>
	<!-- 
	<div id='dashboard' class="w3-border"></div>
 -->
	<div>
		<table class="team">
			<tr>
				<c:forEach items="${title}" var="c" varStatus="status">
					<th>${c }</th>
				</c:forEach>
			</tr>
			<c:set var="pF" value="0" />
			<c:forEach items="${score}" var="c" varStatus="status">
				<c:set var="setp" value="0" />
				<c:if test="${status.index%10==0}">
					<tr class="pls"
						onclick="javascript:player_disp('player${pF} w3-row')">
				</c:if>
				<c:if test="${status.index%10==1}">
					<td class="ts cell teamC"><c:forEach items="${teamCode}"
							var="test">
							<c:set var="cow" value="${c}" />
							<c:if test="${test.key==cow}">
								<a href="${path}/team/tInfo.shop?tcode=${test.value}">
									${test.key} </a>
							</c:if>
						</c:forEach></td>
				</c:if>
				<c:if test="${status.index%10!=1}">
					<td class="ts">${c}</td>
				</c:if>
				<c:if test="${status.index%10==9}">
					</tr>
					<tr>
						<td colspan="10">
							<div id="player${pF} w3-row" style="display: none;">
								<c:forEach items="${pCode}" var="pcode" varStatus="p">
									<c:forEach items="${teamCode}" var="tete">
										<c:if test="${cow==tete.key&&pcode.value==tete.value}">
											<div class="w3-display-container w3-col s2 w3-padding">
												<img src="${path}/picture/team_players/${pcode.key}.jpg" class=" w3-border"
													style="width: 120px; height: 120px; margin-left: 12px; padding:4px;">
												<div class="w3-display-middle w3-display-hover">
													<c:forEach items="${pName}" var="pname">
													<c:if test="${pname.key==pcode.key}">
														<button
															onclick="location.href='${path}/team/pl.shop?pCode=${pname.key}'"
															class="w3-button w3-black">${pname.value}</button>
													</c:if>
													</c:forEach>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:forEach>
							</div>
						</td>
					</tr>
					<c:set var="pF" value="${pF+1}" />
				</c:if>
			</c:forEach>
		</table>
	</div>
	</div>
	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script>
   		var randomColorFactor=function(){
   			return Math.round(Math.random()*255);
   		}
   		var randomColor=function(opacity){
   			return "rgba("+randomColorFactor()+","
   			+randomColorFactor()+","	+randomColorFactor()+","
   			+(opacity||'.3')+")";
   		};
   		
function dashboard(id, fData){
    var barColor = "red";
    var scoreF = "blue";
    var endNum=<c:forEach items="${title}" var="t" varStatus="status"><c:if test="${status.last}">${status.index}</c:if></c:forEach>;
    var colors={};
    for (var i=0;i<=endNum;i++){
    	colors[i]=randomColor(1);
    }
    function segColor(c){ return {<c:forEach items="${title}" var="t" varStatus="status"><c:if test="${status.index==2}">"${t}":barColor</c:if><c:if test="${status.index==3}">"${t}":scoreF</c:if><c:if test="${status.index!=2&&status.index!=3}">"${t}":colors[${status.index}]</c:if><c:if test="${!status.last}">,</c:if></c:forEach>}[c]; }
    /* 
    function segColor(c){ return {low:"#807dba", mid:"#e08214",high:"#41ab5d"}[c]; }
     */
     
    // compute total for each state.
    fData.forEach(function(d){d.total=<c:forEach items="${title}" var="t" varStatus="status"><c:if test="${status.index==2}">d.freq.${status.current}</c:if></c:forEach>;});
	/* 
     fData.forEach(function(d){d.total=d.freq.low+d.freq.mid+d.freq.high;});
    */
     
    // function to handle histogram.
    function histoGram(fD){
        var hG={},    hGDim = {t: 135, r: 0, b: 30, l: 0};
        hGDim.w = 1070 - hGDim.l - hGDim.r, 
        hGDim.h = 200  - hGDim.t - hGDim.b ;
            
        //create svg for histogram.
        var hGsvg = d3.select(id).append("svg")
            .attr("width", hGDim.w + hGDim.l + hGDim.r)
            .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g")
            .attr("transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

        // create function for x-axis mapping.
        var x = d3.scale.ordinal().rangeRoundBands([0, hGDim.w], 0.1)
                .domain(fD.map(function(d) { return d[0]; }));

        // Add x-axis to the histogram svg.
        hGsvg.append("g").attr("class", "x axis")
            .attr("transform", "translate(0," + hGDim.h + ")")
            .call(d3.svg.axis().scale(x).orient("bottom"))
        	/*
         		.selectAll("text")
				.attr("x",-25)
				.attr("y",10)
				.attr("transform", "rotate(-45)");
        	*/

        // Create function for y-axis map.
        var y = d3.scale.linear().range([hGDim.h, 0])
                .domain([0, d3.max(fD, function(d) { return d[1]; })]);

        // Create bars for histogram to contain rectangles and freq labels.
        var bars = hGsvg.selectAll(".bar").data(fD).enter()
                .append("g").attr("class", "bar");
        
        //create the rectangles.
        bars.append("rect")
            .attr("x", function(d) { return x(d[0]); })
            .attr("y", function(d) { return y(d[1]); })
            .attr("width", x.rangeBand())
            .attr("height", function(d) { return hGDim.h - y(d[1]); })
            .attr('fill',barColor)
            .on("mouseover",mouseover)// mouseover is defined below.
            .on("mouseout",mouseout);// mouseout is defined below.
            
        //Create the frequency labels above the rectangles.
        bars.append("text").text(function(d){ return d3.format(",")(d[1])})
            .attr("x", function(d) { return x(d[0])+x.rangeBand()/2; })
            .attr("y", function(d) { return y(d[1])-5; })
            .attr("text-anchor", "middle");
        
        function mouseover(d){  // utility function to be called on mouseover.
            // filter for selected state.
            var st = fData.filter(function(s){ return s.State == d[0];})[0],
                nD = d3.keys(st.freq).map(function(s){ return {type:s, freq:st.freq[s]};});
               
            // call update functions of pie-chart and legend.    
            pC.update(nD);
            leg.update(nD);
        }
        
        function mouseout(d){    // utility function to be called on mouseout.
            // reset the pie-chart and legend.    
            pC.update(tF);
            leg.update(tF);
        }
        
        // create function to update the bars. This will be used by pie-chart.
        hG.update = function(nD, color){
            // update the domain of the y-axis map to reflect change in frequencies.
            y.domain([0, d3.max(nD, function(d) { return d[1]; })]);
            
            // Attach the new data to the bars.
            var bars = hGsvg.selectAll(".bar").data(nD);
            
            // transition the height and color of rectangles.
            bars.select("rect").transition().duration(500)
                .attr("y", function(d) {return y(d[1]); })
                
                .attr("height", function(d) { return hGDim.h - y(d[1]); })
                .attr("fill", color);

            // transition the frequency labels location and change value.
            bars.select("text").transition().duration(500)
                .text(function(d){ return d3.format(",")(d[1])})
                .attr("y", function(d) {return y(d[1])-5; });            
        }        
        return hG;
    }
    
    // function to handle pieChart.
    function pieChart(pD){
        var pC ={},    pieDim ={w:700, h: 500};
        pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
                
        // create svg for pie chart.
        var piesvg = d3.select(id).append("svg").attr('class','pies')
            .attr("width", pieDim.w).attr("height", pieDim.h).append("g")
            .attr("transform", "translate("+pieDim.w/2+","+pieDim.h/2+")");
        
        // create function to draw the arcs of the pie slices.
        var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

        // create a function to compute the pie slice angles.
        var pie = d3.layout.pie().sort(null).value(function(d) { return d.freq; });

        // Draw the pie slices.
 
         piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
            .each(function(d) { this._current = d; })
            .style("fill", function(d) { return segColor(d.data.type); })
            .on("mouseover",mouseover).on("mouseout",mouseout); 
 
        // create function to update pie-chart. This will be used by histogram.
        pC.update = function(nD){
            piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
                .attrTween("d", arcTween);
        }       
        
        // Utility function to be called on mouseover a pie slice.
        function mouseover(d){
            // call the update function of histogram with new data.
            hG.update(fData.map(function(v){ 
                return [v.State,v.freq[d.data.type]];}),segColor(d.data.type));
        }
        
        //Utility function to be called on mouseout a pie slice.
        function mouseout(d){
            // call the update function of histogram with all data.
            hG.update(fData.map(function(v){
                return [v.State,v.total];}), barColor);
        }
        
        // Animating the pie-slice requiring a custom function which specifies
        // how the intermediate paths should be drawn.
        function arcTween(a) {
            var i = d3.interpolate(this._current, a);
            this._current = i(0);
            return function(t) { return arc(i(t));    };
        }    
        return pC;
    }
    
    // function to handle legend.
    function legend(lD){
        var leg = {};
            
        // create table for legend.
        var legend = d3.select(id).append("table").attr('class','legend');
        
        // create one row per segment.
        var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append("tr");
            
        // create the first column for each segment.
        tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
            .attr("width", '16').attr("height", '16')
			.attr("fill",function(d){ return segColor(d.type); });
			 
        // create the second column for each segment.
        tr.append("td").text(function(d){ return d.type;});

        // create the third column for each segment.
        tr.append("td").attr("class",'legendFreq')
            .text(function(d){ return d3.format(",")(d.freq);});

        // create the fourth column for each segment.
        tr.append("td").attr("class",'legendPerc')
            .text(function(d){ return getLegend(d,lD);});

        // Utility function to be used to update the legend.
        leg.update = function(nD){
            // update the data attached to the row elements.
            var l = legend.select("tbody").selectAll("tr").data(nD);

            // update the frequencies.
            l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

            // update the percentage column.
            l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
        }
        
        function getLegend(d,aD){ // Utility function to compute percentage.
            return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
        }

        return leg;
    }
    
    // calculate total frequency by segment for all state.
     var tF = [<c:forEach items="${title}" var="t" begin="2" varStatus="status">"${status.current}",</c:forEach>].map(function(d){ 
        return {type:d, freq: d3.sum(fData.map(function(t){ return t.freq[d];}))}; 
    });  
/*
 	var tF = ['low','mid','high'].map(function(d){ 
        return {type:d, freq: d3.sum(fData.map(function(t){ return t.freq[d];}))}; 
    });     
*/

    // calculate total frequency by state for all segment.
    var sF = fData.map(function(d){return [d.State,d.total];});

    var hG = histoGram(sF), // create the histogram.
        pC = pieChart(tF), // create the pie-chart.
        leg= legend(tF);  // create the legend.
}
</script>

	<script>
	var freqData=[<c:set var="i" value="0"/><c:set var="k" value="0"/>
	<c:forEach items="${teamRankName}" var="teamRankName" varStatus="teamRankNames">
	<c:if test="${teamRankNames.index==k}">{State:"${teamRankNames.current}"
		</c:if>,freq:{<c:forEach items="${title}" var="t" begin="2">"${t}":<c:forEach items="${score}" var="s" varStatus="status"><c:if test="${i%10<2}"><c:set var="i" value="${i+2}"/></c:if><c:if test="${status.index==i}">"${status.current}",</c:if></c:forEach><c:set var="i" value="${i+1}"/></c:forEach><c:set var="k" value="${k+1}"/>}
	},</c:forEach>
	];
	dashboard('#dashboard',freqData);
/* 
 	var freqData=[
	{State:'AL',freq:{low:4786, mid:1319, high:249}}
	,{State:'AZ',freq:{low:1101, mid:412, high:674}}
	,{State:'CT',freq:{low:932, mid:2149, high:418}}
	,{State:'DE',freq:{low:832, mid:1152, high:1862}}
	,{State:'FL',freq:{low:4481, mid:3304, high:948}}
	,{State:'GA',freq:{low:1619, mid:167, high:1063}}
	,{State:'IA',freq:{low:1819, mid:247, high:1203}}
	,{State:'IL',freq:{low:4498, mid:3852, high:942}}
	,{State:'IN',freq:{low:797, mid:1849, high:1534}}
	,{State:'KS',freq:{low:162, mid:379, high:471}}
	];
	dashboard('#dashboard',freqData);
*/
</script>

</body>
</html>