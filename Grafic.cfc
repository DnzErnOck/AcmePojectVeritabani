<cfcomponent>
    <cffunction name="chart" access="remote">
      <cfset result=structNew()>
      <cfset Customers=arrayNew(1)>
      <cfquery name="avgvalue" datasource="AcmeProject">
    SELECT AVG(UCRET) FROM (
    SELECT Customers.CompanyName as Musteri,AVG([Order].OrderPrice) AS Ucret
    FROM [Order] INNER JOIN Customers ON Customers.CustomerID =[Order].CustomerID
    GROUP BY Customers.CompanyName) as abc
    </cfquery>
    <cfquery name="Minvalue" datasource="AcmeProject">
      SELECT Min(UCRET) FROM (
    SELECT Customers.CompanyName as Musteri,AVG([Order].OrderPrice) AS Ucret
    FROM [Order] INNER JOIN Customers ON Customers.CustomerID =[Order].CustomerID
    GROUP BY Customers.CompanyName) as abc
      </cfquery>
        <cfquery name="maxvalue" datasource="AcmeProject">
          SELECT Max(UCRET) FROM (
    SELECT Customers.CompanyName as Musteri,AVG([Order].OrderPrice) AS Ucret
    FROM [Order] INNER JOIN Customers ON Customers.CustomerID =[Order].CustomerID
    GROUP BY Customers.CompanyName) as abc
          </cfquery>
    
      <cfset result.avg = avgvalue>
      <cfset result.max = maxvalue>
      <cfset result.min = minvalue>
      <cfreturn result>
    </cffunction>
    
    <cffunction name="getCustomerRange" access="remote">
      <cfargument name="ranged">
      <cfargument name="min">
      <cfargument name="max">
      <cfloop from="0" to="4" index="i">
          <cfquery name="getCustomers" datasource="AcmeProject">
                    SELECT COUNT(Musteri) FROM (
            SELECT Customers.CompanyName as Musteri,AVG([Order].OrderPrice) AS Ucret
            FROM [Order] INNER JOIN Customers ON Customers.CustomerID =[Order].CustomerID
            GROUP BY Customers.CompanyName) as abc WHERE Ucret Between (#min#+#i#*#ranged#) and #min#+((#i#+1)*#ranged#)
          </cfquery>
          <cfoutput>
             <div style="display:none;">#arrayAppend(Customers,getCustomers)#</div>
          </cfoutput>
      </cfloop>
      <cfreturn Customers>
    </cffunction>
    </cfcomponent>