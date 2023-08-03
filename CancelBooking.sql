DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN

    DELETE FROM bookings WHERE bookingID = booking_id;
    
    -- Print the confirmation or error message
    SELECT  CONCAT('Booking ', booking_id, ' cancelled.') AS Confirmation;
END //

DELIMITER ;