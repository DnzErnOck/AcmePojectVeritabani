<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Table Style</title>
        <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="table.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
        <script src="https://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    </head>
    
    <body>
        <cfquery name="AcmeDataList" datasource="AcmeProject">
         SELECT COUNT(Products.CategoryID) AS ToplamSatis,
       Department.DepartmentName AS SubeAdi,
       Categories.CategoryName AS Kategori,
       SUM([Order].OrderPrice) AS ToplamHarcama
       FROM ((((Products
	   INNER JOIN OrderDetail ON OrderDetail.ProductID=Products.ProductID) 
	   INNER JOIN [Order] ON OrderDetail.OrderID=[Order].OrderID )
       INNER JOIN Department ON [Order].DepartmentID=Department.DepartmentID)
	   
		INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID)
       GROUP BY Department.DepartmentName,Products.CategoryID,Categories.CategoryName
       ORDER BY SubeAdi
          </cfquery>
  
   
    <div class="table-title">
    <h3>Subelere Gore Toplam Satis Raporu</h3>
    </div>
    <table class="table-fill">
    <thead>
    <tr>
    <th class="text-left">Toplam Satis</th>
    <th class="text-left">Sube</th>
    <th class="text-left">Kategori</th>
    <th class="text-left">Toplam Harcama</th>
    </tr>
    </thead>
    
    <tbody class="table-hover">
        <cfoutput query="AcmeDataList">
        <tr>
     <td class="text-left">#ToplamSatis#</td>
    <td class="text-left">#SubeAdi#</td>
    <td class="text-left">#Kategori#</td>
    <td class="text-left">#ToplamHarcama#</td>
    </tr>
</cfoutput>  
    </tbody>
    </table>



      </body>
    
    <script src="script.js"></script>