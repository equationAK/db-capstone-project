DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN

    UPDATE bookings set date = booking_date
    WHERE bookingID = booking_id;
    
    -- Print the confirmation or error message
    SELECT  CONCAT('Booking ', booking_id, ' updated.') AS Confirmation;
END //

DELIMITER ;