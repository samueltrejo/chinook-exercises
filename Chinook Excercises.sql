/*******************************
Query # 1: non_usa_customers.sql
********************************
Provide a query showing
Customers (just their full
names, customer ID and country)
who are not inthe US.
*******************************/
--select FirstName + ' ' + LastName as FullName, CustomerId, Country
--from Customer
--where Country != 'USA'

/******************************
Query # 2: brazil_customers.sql
*******************************
Provide a query only showing
the Customers from Brazil.
******************************/
--select *
--from Customer
--where Country = 'Brazil'

/***************************************
Query # 3: brazil_customers_invoices.sql
****************************************
Provide a query showing the Invoices of
customers who are from Brazil. The
resultant table should show the
customer's full name, Invoice ID, Date
of the invoice and billing country.
***************************************/
--select Customer.FirstName + ' ' + Customer.LastName as FullName,
--	InvoiceId,
--	InvoiceDate,
--	BillingCountry
--from Invoice
--	inner join Customer
--		on Customer.CustomerId = Invoice.CustomerId
--		where Customer.Country = 'Brazil'

/**************************
Query # 4: sales_agents.sql
***************************
Provide a query showing
only the Employees who are
Sales Agents.
**************************/
--select *
--from Employee
--where Title = 'Sales Support Agent'

/**************************************
Query # 5: unique_invoice_countries.sql
***************************************
Provide a query showing a
unique/distinct list of billing
countries from the Invoice table.
**************************************/
--select BillingCountry
--from Invoice
--group by BillingCountry

--select distinct(BillingCountry)
--from Invoice

/**********************************
Query # 6: sales_agent_invoices.sql
***********************************
Provide a query that shows the
invoices associated with each sales
agent. The resultant table should
include the Sales Agent's full
name.
**********************************/
--select Employee.FirstName + ' ' + Employee.LastName as SalesRepFullName,
--	Invoice.InvoiceId,
--	Invoice.InvoiceDate,
--	Customer.FirstName + ' ' + Customer.LastName as CustomerFullName
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--	join Invoice
--		on  Customer.CustomerId = Invoice.CustomerId
--where Employee.Title = 'Sales Support Agent'

/****************************
Query # 7: invoice_totals.sql
*****************************
Provide a query that shows
the Invoice Total, Customer
name, Country and Sale Agent
name for all invoices and
customers.
****************************/
--select sum(Invoice.Total) as Total,
--	Customer.FirstName + ' ' + Customer.LastName as CustomerName,
--	Customer.Country,
--	Employee.FirstName + ' ' + Employee.LastName as SalesAgentName
--from Invoice
--	join Customer
--		on Invoice.CustomerId = Customer.CustomerId
--	join Employee
--		on Employee.EmployeeId = Customer.SupportRepId
--where Employee.Title = 'Sales Support Agent'
--group by Customer.FirstName + ' ' + Customer.LastName,
--	Customer.CustomerId,
--	Customer.Country,
--	Employee.FirstName + ' ' + Employee.LastName

/*********************************
Query # 8: total_invoices_year.sql
**********************************
How many Invoices were there in
2009 and 2011?
*********************************/
--select DateRange.range as [Year], count(*) as NumberOfInvoices
--from (
--  select case  
--    when Invoice.InvoiceDate like '%2009%' then '2009'
--    when Invoice.InvoiceDate like '%2011%' then '2011'
--	end as range
--  from Invoice
--	where InvoiceDate like '%2009%'
--	OR InvoiceDate like '%2011%') as DateRange
--group by DateRange.range

--select year(Invoice.InvoiceDate),
--	count(*)
--from Invoice
--where year(Invoice.InvoiceDate) in (2009, 2011)
--group by year(Invoice.InvoiceDate)

--select datepart(year, InvoiceDate) as [Year],
--	count(invoiceId) as NumberOfInvoices
--from Invoice
--where InvoiceDate like '%2009%'
--OR InvoiceDate like '%2011%'
--group by datepart(year, InvoiceDate)

/******************************
Query # 9: total_sales_year.sql
*******************************
What are the respective total
sales for each of those years?
******************************/
--select MyInvoiceTable.DateRange,
--	sum(MyInvoiceTable.Total)
--from (
--  select Invoice.Total,
--    (case  
--    when Invoice.InvoiceDate like '%2009%' then '2009'
--    when Invoice.InvoiceDate like '%2011%' then '2011'
--	end) as DateRange
--  from Invoice
--	where year(Invoice.InvoiceDate) in (2009, 2011)) MyInvoiceTable
--group by DateRange

--select year(Invoice.InvoiceDate),
--	sum(Total)
--from Invoice
--where year(Invoice.InvoiceDate) in (2009, 2011)
--group by year(Invoice.InvoiceDate)

/*****************************************
Query # 10: invoice_37_line_item_count.sql
******************************************
Looking at the InvoiceLine table, provide
a query that COUNTs the number of line
items for Invoice ID 37.
*****************************************/
--select InvoiceLine.InvoiceId,
--	count(InvoiceLine.InvoiceId) as NumberOfItems
--from InvoiceLine
--where InvoiceLine.InvoiceId = 37
--group by InvoiceLine.InvoiceId

/*************************************
Query # 11: line_items_per_invoice.sql
**************************************
Looking at the InvoiceLine table,
provide a query that COUNTs the number
of line items for each Invoice.
HINT: GROUP BY
*************************************/
--select InvoiceLine.InvoiceId,
--	count(InvoiceLine.InvoiceId) as NumberOfItems
--from InvoiceLine
--group by InvoiceLine.InvoiceId

/******************************
Query # 12: line_item_track.sql
*******************************
Provide a query that includes
the purchased track name with
each invoice line item.
******************************/
--select InvoiceLine.*, Track.Name
--from InvoiceLine
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--order by InvoiceLine.InvoiceLineId

/*************************************
Query # 13: line_item_track_artist.sql
**************************************
Provide a query that includes the
purchased track name AND artist name
with each invoice line item.
**************************************/
--select InvoiceLine.InvoiceLineId,
--	Track.Name,
--	Artist.Name
--from Invoice
--	join InvoiceLine
--		on Invoice.InvoiceId = InvoiceLine.InvoiceId
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--	join Album
--		on Track.AlbumId = Album.AlbumId
--	join Artist
--		on Album.ArtistId = Artist.ArtistId
--order by Track.Name

/*******************************
Query # 14: country_invoices.sql
********************************
Provide a query that shows the #
of invoices per country. HINT:
GROUP BY
*******************************/
--select Invoice.BillingCountry,
--	count(Invoice.InvoiceId) as NumberOfInvoices
--from Invoice
--group by Invoice.BillingCountry

/************************************
Query # 15: playlists_track_count.sql
*************************************
Provide a query that shows the total
number of tracks in each playlist.
The Playlist name should be include
on the resulant table.
************************************/
--select Playlist.Name,
--	Count(PlaylistTrack.TrackId) as NumberOfTracks
--from PlaylistTrack
--	join Playlist
--		on PlaylistTrack.PlaylistId = Playlist.PlaylistId
--group by Playlist.Name

/***************************
Query # 16: tracks_no_id.sql
****************************
Provide a query that shows
all the Tracks, but displays
no IDs. The result should
include the Album name,
Media type and Genre.
****************************/
--select Track.Name as TrackName,
--	Album.Title as AlbumName,
--	MediaType.Name as MediaType,
--	Genre.Name as Genre
--from Track
--	join Album
--		on Track.AlbumId = Album.AlbumId
--	join MediaType
--		on Track.MediaTypeId = MediaType.MediaTypeId
--	join Genre
--		on Track.GenreId = Genre.GenreId

/***************************************
Query # 17: invoices_line_item_count.sql
****************************************
Provide a query that shows all Invoices
but includes the # of invoice line items.
***************************************/
--select Invoice.InvoiceId,
--	count(InvoiceLine.InvoiceLineId) as NumberOfLineItems
--from Invoice
--	join InvoiceLine
--		on Invoice.InvoiceId = InvoiceLine.InvoiceId
--group by Invoice.InvoiceId

/**************************************
Query # 18: sales_agent_total_sales.sql
***************************************
Provide a query that shows total sales
made by each sales agent.
***************************************/
--select Employee.FirstName + ' ' + Employee.LastName as SalesAgent,
--	sum(Invoice.Total) as TotalSales
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--	join Invoice
--		on Customer.CustomerId = Invoice.CustomerId
--where Employee.Title = 'Sales Support Agent'
--group by Employee.FirstName + ' ' + Employee.LastName

/*****************************
Query # 19: top_2009_agent.sql
******************************
Which sales agent made the
most in sales in 2009?
HINT: TOP
*****************************/
--select top(1) Employee.FirstName + ' ' + Employee.LastName as SalesAgent,
--	datepart(year, Invoice.InvoiceDate) as [Year],
--	sum(Invoice.Total) as TotalSales
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--	join Invoice
--		on Customer.CustomerId = Invoice.CustomerId
--where Invoice.InvoiceDate like '%2009%'
--group by Employee.FirstName + ' ' + Employee.LastName,
--	datepart(year, Invoice.InvoiceDate)
--order by sum(Invoice.Total) desc

/************************
Query # 20: top_agent.sql
*************************
Which sales agent made
the most in sales over
all?
************************/
--select top(1) Employee.FirstName + ' ' + Employee.LastName as SalesAgent,
--	sum(Invoice.Total) as TotalSales
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--	join Invoice
--		on Customer.CustomerId = Invoice.CustomerId
--group by Employee.FirstName + ' ' + Employee.LastName
--order by sum(Invoice.Total) desc

/*****************************************
Query # 21: sales_agent_customer_count.sql
******************************************
Provide a query that shows the count of
customers assigned to each sales agent.
*****************************************/
--select Employee.FirstName + ' ' + Employee.LastName as SalesAgent,
--	count(Customer.CustomerId) as NumberOfCustomers
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--group by Employee.FirstName + ' ' + Employee.LastName

/********************************
Query # 22: sales_per_country.sql
*********************************
Provide a query that shows the
total sales per country.
********************************/
--select Invoice.BillingCountry,
--	sum(Invoice.Total) as TotalSales
--from Invoice
--group by Invoice.BillingCountry

/**************************
Query # 23: top_country.sql
***************************
Which country's customers
spent the most?
**************************/
--select Customer.FirstName + ' ' + Customer.LastName as CustomerName,
--	sum(Invoice.Total) as TotalSales,
--	Customer.Country
--from Customer
--	join Invoice
--		on Customer.CustomerId = Invoice.CustomerId
--group by Customer.FirstName + ' ' + Customer.LastName,
--	Customer.Country
--order by sum(Invoice.Total) desc

/*****************************
Query # 24: top_2013_track.sql
******************************
Provide a query that shows the
most purchased track of 2013.
*****************************/
--select Track.Name,
--	count(InvoiceLine.TrackId) as NumberOfPurchases,
--	datepart(year, Invoice.InvoiceDate) as [Year]
--from InvoiceLine
--	join Invoice
--		on InvoiceLine.InvoiceId = Invoice.InvoiceId
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--where Invoice.InvoiceDate like '%2013%'
--group by Track.Name,
--	datepart(year, Invoice.InvoiceDate)
--order by count(InvoiceLine.TrackId) desc

----Nathan Example--
--select Track.Name,
--	sum(InvoiceLine.Quantity)
--from InvoiceLine
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--	join Invoice
--		on InvoiceLine.InvoiceId = Invoice.InvoiceId
--where year(Invoice.InvoiceDate) = 2013
--group by Track.TrackId, Track.Name
--order by sum(InvoiceLine.Quantity) desc

/***************************
Query # 25: top_5_tracks.sql
****************************
Provide a query that shows
the top 5 most purchased
songs.
***************************/
--select top(5) Track.Name,
--	count(InvoiceLine.TrackId) as NumberOfPurchases
--from InvoiceLine
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--group by Track.Name
--order by count(InvoiceLine.TrackId) desc

/****************************
Query # 26: top_3_artists.sql
*****************************
Provide a query that shows
the top 3 best selling
artists.
****************************/
--select top(3) Artist.Name as ArtistName,
--	count(Artist.ArtistId) as AmountOfPurchases,
--	sum(InvoiceLine.UnitPrice) as TotalSales
--from InvoiceLine
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--	join Album
--		on Track.AlbumId = Album.AlbumId
--	join Artist
--		on Album.ArtistId = Artist.ArtistId
--group by Artist.Name
--order by count(Artist.ArtistId) desc

/*****************************
Query # 27: top_media_type.sql
******************************
Provide a query that shows the
most purchased Media Type.
*****************************/
--select MediaType.Name,
--	count(MediaType.Name) as AmountOfPurchases,
--	sum(InvoiceLine.UnitPrice) as TotalSales
--from InvoiceLine
--	join Track
--		on InvoiceLine.TrackId = Track.TrackId
--	join MediaType
--		on Track.MediaTypeId = MediaType.MediaTypeId
--group by MediaType.Name
--order by count(MediaType.Name) desc
