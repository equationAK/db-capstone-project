SELECT c.customerID, c.fullName, o.orderID, o.totalCost, m.menuName, mi.CourseName
FROM customers AS c
JOIN bookings AS b ON b.customerID = c.customerID
JOIN orders AS o ON b.bookingID = o.bookingID
JOIN Menu AS m ON o.menuID = m.menuID
JOIN MenuItems AS mi ON m.MemuItemsID = mi.MenuItemsID;