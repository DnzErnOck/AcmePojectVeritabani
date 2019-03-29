<cfprocessingdirective pageencoding="utf-8" />
<cfset creatObje=createObject("component","cfc.Grafic")>
<cfset creatAvg = creatObje.chart().avg.COMPUTED_COLUMN_1>
<cfset creatMin = creatObje.chart().min.COMPUTED_COLUMN_1>
<cfset creatMax = creatObje.chart().max.COMPUTED_COLUMN_1>
<cfset totalResult = (creatMax-creatMin)/5 />
<cfset customers = creatObje.getCustomerRange(totalResult,creatMin,creatMax)>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Müşterilere Göre Satış Tutarı Raporu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  
    <script src="script.js"></script>
</head>
<body>
    <div class="container">
        <div class="row" style="margin-top:10vh;">
        <div class="col-md-3"></div>
        <h3 class="col-md-6">Müşterilerin ortalama harcaması</h3>
        <div class="col-md-3"></div>
        <cfchart format="html" chartWidth="600" chartHeight="400" width="100%" height="70vh" pieSliceStyle="solid">
            <cfchartseries type="pie" serieslabel="Müşterilerin ortalama harcaması: #creatAvg# TL">
                <cfchartdata item="#(creatMax-creatMin)/5+creatMin#" value="#customers[1].COMPUTED_COLUMN_1#">
                <cfchartdata item="#2*(creatMax-creatMin)/5+creatMin#" value="#customers[2].COMPUTED_COLUMN_1#">
                <cfchartdata item="#3*(creatMax-creatMin)/5+creatMin#" value="#customers[3].COMPUTED_COLUMN_1#">
                <cfchartdata item="#4*(creatMax-creatMin)/5+creatMin#" value="#customers[4].COMPUTED_COLUMN_1#">
                <cfchartdata item="#5*(creatMax-creatMin)/5+creatMin#" value="#customers[5].COMPUTED_COLUMN_1#">
            </cfchartseries>
        </cfchart>
    </div>
    </div>
</body>
</html>
