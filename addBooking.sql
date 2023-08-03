DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN booking_date DATE, IN table_nr INT)
BEGIN

    INSERT INTO bookings (bookingID, customerID, date, tableNr)
    VALUES (booking_id, customer_id, booking_date, table_nr);
    
    -- Print the confirmation or error message
    SELECT  'New booking was added' AS Confirmation;
END //

DELIMITER ;